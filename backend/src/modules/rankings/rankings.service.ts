import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Prediction } from '../../infrastructure/database/entities/prediction.entity';
import { User } from '../../infrastructure/database/entities/user.entity';

@Injectable()
export class RankingsService {
  constructor(
    @InjectRepository(Prediction) private predRepo: Repository<Prediction>,
    @InjectRepository(User) private userRepo: Repository<User>,
  ) {}

  async getLeaderboard() {
    const rows = await this.predRepo
      .createQueryBuilder('pred')
      .select('pred.userId', 'userId')
      .addSelect('SUM(pred.points)', 'totalPoints')
      .addSelect('COUNT(CASE WHEN pred.points = 3 THEN 1 END)', 'exactCount')
      .addSelect('COUNT(CASE WHEN pred.points IS NOT NULL THEN 1 END)', 'settledCount')
      .where('pred.points IS NOT NULL')
      .groupBy('pred.userId')
      .orderBy('"totalPoints"', 'DESC')
      .addOrderBy('"exactCount"', 'DESC')
      .getRawMany();

    const userIds = rows.map((r) => r.userId);
    if (!userIds.length) return [];

    const users = await this.userRepo.findByIds(userIds);
    const userMap = new Map(users.map((u) => [u.id, u]));

    return rows.map((row, idx) => ({
      position: idx + 1,
      userId: row.userId,
      firstName: userMap.get(row.userId)?.firstName ?? '',
      lastName: userMap.get(row.userId)?.lastName ?? '',
      totalPoints: parseInt(row.totalPoints ?? '0', 10),
      exactCount: parseInt(row.exactCount ?? '0', 10),
      settledCount: parseInt(row.settledCount ?? '0', 10),
    }));
  }

  async getUserRank(userId: string) {
    const board = await this.getLeaderboard();
    return board.find((r) => r.userId === userId) ?? null;
  }
}
