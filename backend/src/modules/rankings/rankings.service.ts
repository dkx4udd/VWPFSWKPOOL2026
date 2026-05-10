import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Prediction } from '../../infrastructure/database/entities/prediction.entity';
import { BonusPrediction } from '../../infrastructure/database/entities/bonus-prediction.entity';
import { User } from '../../infrastructure/database/entities/user.entity';

@Injectable()
export class RankingsService {
  constructor(
    @InjectRepository(Prediction) private predRepo: Repository<Prediction>,
    @InjectRepository(BonusPrediction) private bonusRepo: Repository<BonusPrediction>,
    @InjectRepository(User) private userRepo: Repository<User>,
  ) {}

  async getLeaderboard() {
    const matchRows = await this.predRepo
      .createQueryBuilder('pred')
      .select('pred.userId', 'userId')
      .addSelect('COALESCE(SUM(pred.points), 0)', 'matchPoints')
      .addSelect('COUNT(CASE WHEN pred.points = 10 THEN 1 END)', 'exactCount')
      .addSelect('COUNT(CASE WHEN pred.points IS NOT NULL THEN 1 END)', 'settledCount')
      .where('pred.points IS NOT NULL')
      .groupBy('pred.userId')
      .getRawMany();

    const bonusRows = await this.bonusRepo
      .createQueryBuilder('bp')
      .select('bp.userId', 'userId')
      .addSelect('COALESCE(SUM(bp.points), 0)', 'bonusPoints')
      .where('bp.points IS NOT NULL')
      .groupBy('bp.userId')
      .getRawMany();

    const bonusMap = new Map<string, number>(
      bonusRows.map(b => [b.userId, parseInt(b.bonusPoints ?? '0', 10)]),
    );
    const matchMap = new Map(matchRows.map(r => [r.userId, r]));

    const allUsers = await this.userRepo.find();

    const combined = allUsers.map(user => {
      const row = matchMap.get(user.id);
      const matchPts = parseInt(row?.matchPoints ?? '0', 10);
      const bonusPts = bonusMap.get(user.id) ?? 0;
      return {
        userId: user.id,
        firstName: user.firstName,
        lastName: user.lastName,
        matchPoints: matchPts,
        bonusPoints: bonusPts,
        totalPoints: matchPts + bonusPts,
        exactCount: parseInt(row?.exactCount ?? '0', 10),
        settledCount: parseInt(row?.settledCount ?? '0', 10),
      };
    });

    combined.sort((a, b) => {
      if (b.totalPoints !== a.totalPoints) return b.totalPoints - a.totalPoints;
      if (b.exactCount !== a.exactCount) return b.exactCount - a.exactCount;
      return a.firstName.localeCompare(b.firstName) || a.lastName.localeCompare(b.lastName);
    });

    return combined.map((entry, idx) => ({ position: idx + 1, ...entry }));
  }

  async getUserRank(userId: string) {
    const board = await this.getLeaderboard();
    return board.find(r => r.userId === userId) ?? null;
  }

  async getUserPredictions(userId: string) {
    const preds = await this.predRepo.find({
      where: { userId },
      relations: ['match', 'match.homeTeam', 'match.awayTeam'],
      order: { match: { scheduledAt: 'ASC' } } as any,
    });

    return preds.map(p => ({
      matchId: p.matchId,
      homeScore: p.homeScore,
      awayScore: p.awayScore,
      points: p.points,
      isRevised: p.isRevised,
      match: {
        scheduledAt: p.match.scheduledAt,
        phase: p.match.phase,
        group: p.match.group,
        status: p.match.status,
        homeScore: p.match.homeScore,
        awayScore: p.match.awayScore,
        homeTeam: p.match.homeTeam
          ? { name: p.match.homeTeam.nameNl, flagEmoji: p.match.homeTeam.flagEmoji }
          : null,
        awayTeam: p.match.awayTeam
          ? { name: p.match.awayTeam.nameNl, flagEmoji: p.match.awayTeam.flagEmoji }
          : null,
        homeTeamPlaceholder: p.match.homeTeamPlaceholder,
        awayTeamPlaceholder: p.match.awayTeamPlaceholder,
      },
    }));
  }
}
