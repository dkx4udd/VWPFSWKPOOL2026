import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, In } from 'typeorm';
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

    const allUserIds = [...new Set([...matchMap.keys(), ...bonusMap.keys()])];
    if (!allUserIds.length) return [];

    const users = await this.userRepo.find({ where: { id: In(allUserIds) } });
    const userMap = new Map(users.map(u => [u.id, u]));

    const combined = allUserIds.map(userId => {
      const row = matchMap.get(userId);
      const matchPts = parseInt(row?.matchPoints ?? '0', 10);
      const bonusPts = bonusMap.get(userId) ?? 0;
      return {
        userId,
        firstName: userMap.get(userId)?.firstName ?? '',
        lastName: userMap.get(userId)?.lastName ?? '',
        matchPoints: matchPts,
        bonusPoints: bonusPts,
        totalPoints: matchPts + bonusPts,
        exactCount: parseInt(row?.exactCount ?? '0', 10),
        settledCount: parseInt(row?.settledCount ?? '0', 10),
      };
    });

    combined.sort((a, b) => b.totalPoints - a.totalPoints || b.exactCount - a.exactCount);
    return combined.map((entry, idx) => ({ position: idx + 1, ...entry }));
  }

  async getUserRank(userId: string) {
    const board = await this.getLeaderboard();
    return board.find(r => r.userId === userId) ?? null;
  }
}
