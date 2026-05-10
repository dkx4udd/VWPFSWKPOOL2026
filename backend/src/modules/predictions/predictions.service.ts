import {
  Injectable, NotFoundException, BadRequestException, ForbiddenException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Prediction } from '../../infrastructure/database/entities/prediction.entity';
import { Match, MatchStatus } from '../../infrastructure/database/entities/match.entity';
import { UpsertPredictionDto } from './dto/upsert-prediction.dto';

@Injectable()
export class PredictionsService {
  constructor(
    @InjectRepository(Prediction) private predRepo: Repository<Prediction>,
    @InjectRepository(Match) private matchRepo: Repository<Match>,
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

  async settleMatch(matchId: string) {
    const match = await this.matchRepo.findOne({ where: { id: matchId } });
    if (!match || match.status !== MatchStatus.FINISHED) {
      throw new BadRequestException('Match is not finished yet');
    }
    if (match.homeScore === null || match.awayScore === null) {
      throw new BadRequestException('Match has no final score');
    }

    const predictions = await this.predRepo.find({ where: { matchId } });
    for (const pred of predictions) {
      const pts = this.calculatePoints(
        pred.homeScore, pred.awayScore,
        match.homeScore!, match.awayScore!,
      );
      await this.predRepo.update(pred.id, { points: pts });
    }
    return { settled: predictions.length };
  }
}
