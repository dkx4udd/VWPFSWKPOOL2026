import {
  Injectable, NotFoundException, BadRequestException, ForbiddenException,
} from '@nestjs/common';
import { MatchPhase } from '../../infrastructure/database/entities/match.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Prediction } from '../../infrastructure/database/entities/prediction.entity';
import { Match, MatchStatus } from '../../infrastructure/database/entities/match.entity';
import { Booster } from '../../infrastructure/database/entities/booster.entity';
import { UpsertPredictionDto } from './dto/upsert-prediction.dto';

@Injectable()
export class PredictionsService {
  constructor(
    @InjectRepository(Prediction) private predRepo: Repository<Prediction>,
    @InjectRepository(Match)      private matchRepo: Repository<Match>,
    @InjectRepository(Booster)    private boosterRepo: Repository<Booster>,
  ) {}

  async upsert(userId: string, matchId: string, dto: UpsertPredictionDto) {
    const match = await this.matchRepo.findOne({ where: { id: matchId } });
    if (!match) throw new NotFoundException('Match not found');

    if (match.status !== MatchStatus.SCHEDULED) {
      throw new ForbiddenException('Predictions can only be changed before the match starts');
    }
    if (new Date() >= match.scheduledAt) {
      throw new ForbiddenException('Predictions are locked — match has started');
    }

    const existing = await this.predRepo.findOne({ where: { userId, matchId } });
    if (existing) {
      await this.predRepo.update(existing.id, {
        homeScore: dto.homeScore,
        awayScore: dto.awayScore,
        points: null,
      });
      return this.predRepo.findOne({ where: { id: existing.id } });
    }

    const pred = this.predRepo.create({ userId, matchId, ...dto, points: null });
    return this.predRepo.save(pred);
  }

  findForUser(userId: string) {
    return this.predRepo.find({
      where: { userId },
      relations: ['match', 'match.homeTeam', 'match.awayTeam'],
      order: { match: { scheduledAt: 'ASC' } },
    });
  }

  findForMatch(matchId: string) {
    return this.predRepo.find({ where: { matchId } });
  }

  // WK history score (0-100): gebaseerd op titels, finales, halve finales en recente prestaties
  // Bron: Wikipedia — Lijst van records en statistieken van het wereldkampioenschap voetbal
  private static readonly WK_HISTORY: Record<string, number> = {
    'BR':  100, // 5 titels (1958,1962,1970,1994,2002), 22× deelname, meeste overwinningen
    'DE':   90, // 4 titels (1954,1974,1990,2014), 8 finales, meest constante WK-natie
    'AR':   88, // 3 titels (1978,1986,2022), finalist 2014, dominante recente vorm
    'FR':   80, // 2 titels (1998,2018), finalist 2022, consistent in moderne era
    'UY':   60, // 2 titels (1930,1950), 4e 1954, historisch sterk
    'ES':   65, // 1 titel (2010), finalist 1950, meerdere QF
    'EN':   55, // 1 titel (1966), SF 2018, QF 2022
    'NL':   62, // 0 titels maar 3× finalist (1974,1978,2010), sterk historisch
    'HR':   55, // finalist 2018, 3e 2022 — uitstekende recente vorm
    'PT':   45, // 3e 1966, SF 2006, QF 2022; sterk maar nooit winnaar
    'BE':   40, // 3e 2018 (gouden generatie), meerdere QF
    'MA':   38, // SF 2022 (historisch, eerste Afrikaans land in SF), QF 1986
    'SE':   35, // finalist 1958, 3e 1950 en 1994, consistent
    'MX':   35, // 17× deelname, 14× kwartfinale max (nooit verder), ervaren
    'TR':   30, // 3e 2002, daarna lang afwezig — enige grote prestatie
    'PY':   28, // QF 1930 en 2010, solide WK-geschiedenis
    'CH':   25, // QF 1934,1938,1954; consistent deelnemer
    'KR':   25, // 4e 2002 (thuisvoordeel), R16 recent
    'JP':   25, // QF 2022, R16 meerdere keren — Aziatisch sterkste
    'US':   22, // QF 2002, SF 1930; regelmatig deelnemer
    'SN':   22, // QF 2002, finalist AFCON, R16 2022
    'GH':   20, // QF 2010, R16 2006 en 2014
    'AU':   18, // QF 2006, R16 meerdere keren
    'AT':   20, // 3e 1954, finalist 1936 (niet erkend), QF meerdere
    'CZ':   18, // (vh. Tsjecho-Slowakije) finalist 1934 en 1962
    'CO':   30, // QF 2014, sterk in recente toernooien
    'NO':   10, // QF 1938, verder geen doorbraken
    'DZ':   15, // R16 2014 — historisch hoogtepunt
    'EC':   10, // R16 2006, pas debutant in hogere regionen
    'SCO':  12, // regelmatig deelnemer maar nooit knock-outronde
    'IR':   10, // meerdere WK's maar nooit knock-outronde
    'TN':   10, // R16 2022 (gedeeld), verder groepsfase
    'CI':   10, // 3× WK, nooit knock-outronde
    'CD':   8,  // als Zaïre WK 1974, sindsdien afwezig
    'EG':   5,  // 3× WK (1934,1990,2018), nooit knock-outronde modern era
    'CA':   5,  // WK 1986 (geen goal), WK 2022 (R16), pril
    'BA':   5,  // WK 2014 debuut, groepsfase
    'ZA':   5,  // host 2010, groepsfase; 3× WK-deelname
    'SA':   8,  // QF 1994, 4× WK, verder weinig
    'IQ':   2,  // WK 1986 alleen
    'UZ':   0,  // eerste WK
    'JO':   0,  // eerste WK
    'QA':   2,  // host 2022, groepsfase zonder punt
    'PA':   2,  // WK 2018 debuut, groepsfase
    'CV':   0,  // eerste WK
    'HT':   2,  // WK 1974 enige deelname
    'CW':   0,  // eerste WK
    'NZ':   2,  // WK 1982 en 2010, nooit punt gewonnen
  };

  async getAiPredictions(): Promise<{ matchId: string; homePct: number; drawPct: number; awayPct: number }[]> {
    const matches = await this.matchRepo.find({
      relations: ['homeTeam', 'awayTeam'],
    });

    const MAX_RANK = 100;

    return matches
      .filter(m => m.homeTeam?.fifaRank != null && m.awayTeam?.fifaRank != null)
      .map(m => {
        const homeRank = m.homeTeam!.fifaRank!;
        const awayRank = m.awayTeam!.fifaRank!;
        const homeIso  = m.homeTeam!.isoCode;
        const awayIso  = m.awayTeam!.isoCode;

        // Rankingsterkte (0–1), rank 1 = 1.0
        const homeRankStr = 1 - (homeRank - 1) / MAX_RANK;
        const awayRankStr = 1 - (awayRank - 1) / MAX_RANK;

        // WK-historiescore (0–1)
        const homeHist = (PredictionsService.WK_HISTORY[homeIso] ?? 3) / 100;
        const awayHist = (PredictionsService.WK_HISTORY[awayIso] ?? 3) / 100;

        // Gecombineerde sterkte: 60% FIFA ranking + 40% WK-historie
        const homeStr = 0.60 * homeRankStr + 0.40 * homeHist;
        const awayStr = 0.60 * awayRankStr + 0.40 * awayHist;

        // Logistieke functie → winkans
        const diff = (homeStr - awayStr) * 4;
        const pHomeRaw = 1 / (1 + Math.exp(-diff));

        // Gelijkspelkans daalt bij groot sterktesverschil, min 15%
        const pDraw = Math.max(0.15, 0.28 - Math.abs(homeStr - awayStr) * 0.50);

        const pHome = Math.round(pHomeRaw * (1 - pDraw) * 100);
        const pAway = Math.round((1 - pHomeRaw) * (1 - pDraw) * 100);
        const pDrawFinal = 100 - pHome - pAway;

        return { matchId: m.id, homePct: pHome, drawPct: pDrawFinal, awayPct: pAway };
      });
  }

  async getStats(): Promise<{ matchId: string; total: number; homePct: number; drawPct: number; awayPct: number }[]> {
    const rows: { match_id: string; total: string; home_wins: string; draws: string; away_wins: string }[] =
      await this.predRepo.query(`
        SELECT
          match_id,
          COUNT(*) AS total,
          COUNT(CASE WHEN home_score > away_score THEN 1 END)  AS home_wins,
          COUNT(CASE WHEN home_score = away_score THEN 1 END)  AS draws,
          COUNT(CASE WHEN home_score < away_score THEN 1 END)  AS away_wins
        FROM predictions
        WHERE home_score IS NOT NULL AND away_score IS NOT NULL
        GROUP BY match_id
      `);

    return rows.map(r => {
      const total = Number(r.total);
      const home  = Number(r.home_wins);
      const draw  = Number(r.draws);
      const away  = Number(r.away_wins);
      return {
        matchId:  r.match_id,
        total,
        homePct:  total ? Math.round((home / total) * 100) : 0,
        drawPct:  total ? Math.round((draw / total) * 100) : 0,
        awayPct:  total ? Math.round((away / total) * 100) : 0,
      };
    });
  }

  calculatePoints(
    predHome: number, predAway: number,
    realHome: number, realAway: number,
  ): number {
    // Exact score
    if (predHome === realHome && predAway === realAway) return 10;

    const predOutcome = Math.sign(predHome - predAway);
    const realOutcome = Math.sign(realHome - realAway);
    const correctOutcome = predOutcome === realOutcome;
    const homeMatch = predHome === realHome;
    const awayMatch = predAway === realAway;

    // Correct draw (predicted draw, result is draw, not exact score)
    if (correctOutcome && predOutcome === 0) return 7;

    // Correct winner + one team score exact
    if (correctOutcome && (homeMatch || awayMatch)) return 5;

    // Correct winner only
    if (correctOutcome) return 3;

    // One team score exact (wrong outcome)
    if (homeMatch || awayMatch) return 1;

    return 0;
  }

  async revise(userId: string, matchId: string, dto: UpsertPredictionDto) {
    const match = await this.matchRepo.findOne({ where: { id: matchId } });
    if (!match) throw new NotFoundException('Match not found');
    if (match.phase === MatchPhase.GROUP)
      throw new ForbiddenException('Groepsfase wedstrijden kunnen niet worden aangepast');
    if (match.status !== MatchStatus.SCHEDULED)
      throw new ForbiddenException('Wedstrijd is al begonnen');

    const lockTime = new Date(match.scheduledAt.getTime() - 60 * 1000);
    if (new Date() >= lockTime)
      throw new ForbiddenException('Aanpastijd is voorbij (1 minuut voor aftrap)');

    const existing = await this.predRepo.findOne({ where: { userId, matchId } });
    if (existing) {
      await this.predRepo.update(existing.id, {
        homeScore: dto.homeScore, awayScore: dto.awayScore, isRevised: true, points: null,
      });
      return this.predRepo.findOne({ where: { id: existing.id } });
    }
    const pred = this.predRepo.create({ userId, matchId, ...dto, isRevised: true, points: null });
    return this.predRepo.save(pred);
  }

  async settleMatch(matchId: string) {
    const match = await this.matchRepo.findOne({ where: { id: matchId } });
    if (!match || match.status !== MatchStatus.FINISHED) {
      throw new BadRequestException('Match is not finished yet');
    }
    if (match.homeScore === null || match.awayScore === null) {
      throw new BadRequestException('Match has no final score');
    }

    const predictions = await this.predRepo.find({ where: { matchId } });
    const boosters    = await this.boosterRepo.find({ where: { matchId } });
    const boostedUsers = new Set(boosters.map(b => b.userId));

    for (const pred of predictions) {
      const raw      = this.calculatePoints(pred.homeScore, pred.awayScore, match.homeScore!, match.awayScore!);
      const boosted  = boostedUsers.has(pred.userId) ? raw * 2 : raw;
      const pts      = pred.isRevised ? Math.floor(boosted / 2) : boosted;
      await this.predRepo.update(pred.id, { points: pts });
    }
    return { settled: predictions.length };
  }

  async getUserBoosters(userId: string) {
    return this.boosterRepo.find({ where: { userId } });
  }

  async toggleBooster(userId: string, matchId: string): Promise<{ active: boolean; matchId: string }> {
    const match = await this.matchRepo.findOne({ where: { id: matchId } });
    if (!match) throw new NotFoundException('Match not found');
    if (match.phase !== MatchPhase.GROUP || !match.group)
      throw new BadRequestException('Booster alleen beschikbaar in groepsfase');
    if (match.status !== MatchStatus.SCHEDULED)
      throw new ForbiddenException('Wedstrijd is al begonnen');
    if (new Date() >= match.scheduledAt)
      throw new ForbiddenException('Wedstrijd is al begonnen');

    const existing = await this.boosterRepo.findOne({ where: { userId, matchId } });
    if (existing) {
      await this.boosterRepo.delete(existing.id);
      return { active: false, matchId };
    }

    // Verwijder eventuele andere booster in dezelfde groep
    await this.boosterRepo.delete({ userId, matchGroup: match.group });

    const booster = this.boosterRepo.create({ userId, matchId, matchGroup: match.group });
    await this.boosterRepo.save(booster);
    return { active: true, matchId };
  }
}
