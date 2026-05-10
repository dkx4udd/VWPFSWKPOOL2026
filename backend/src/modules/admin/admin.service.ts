import { Injectable, NotFoundException, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Match, MatchStatus } from '../../infrastructure/database/entities/match.entity';
import { Prediction } from '../../infrastructure/database/entities/prediction.entity';
import { User, UserRole } from '../../infrastructure/database/entities/user.entity';
import { UpdateMatchDto } from './dto/update-match.dto';

@Injectable()
export class AdminService {
  constructor(
    @InjectRepository(Match) private matchRepo: Repository<Match>,
    @InjectRepository(Prediction) private predRepo: Repository<Prediction>,
    @InjectRepository(User) private userRepo: Repository<User>,
  ) {}

  async getStats() {
    const [totalMatches, finishedMatches, liveMatches, totalPredictions, totalUsers] = await Promise.all([
      this.matchRepo.count(),
      this.matchRepo.count({ where: { status: MatchStatus.FINISHED } }),
      this.matchRepo.count({ where: { status: MatchStatus.LIVE } }),
      this.predRepo.count(),
      this.userRepo.count(),
    ]);
    const settledPredictions = await this.predRepo
      .createQueryBuilder('p').where('p.points IS NOT NULL').getCount();

    return { totalMatches, finishedMatches, liveMatches, totalPredictions, settledPredictions, totalUsers };
  }

  async getMatches() {
    const matches = await this.matchRepo.find({
      relations: ['homeTeam', 'awayTeam'],
      order: { scheduledAt: 'ASC' },
    });
    const counts = await this.predRepo
      .createQueryBuilder('p')
      .select('p.matchId', 'matchId')
      .addSelect('COUNT(*)', 'count')
      .groupBy('p.matchId')
      .getRawMany();
    const countMap = Object.fromEntries(counts.map(c => [c.matchId, parseInt(c.count)]));
    return matches.map(m => ({ ...m, predictionCount: countMap[m.id] ?? 0 }));
  }

  async updateMatch(matchId: string, dto: UpdateMatchDto) {
    const match = await this.matchRepo.findOne({ where: { id: matchId } });
    if (!match) throw new NotFoundException('Match not found');
    const update: Partial<Match> = {};
    if (dto.status !== undefined) update.status = dto.status;
    if (dto.homeScore !== undefined) update.homeScore = dto.homeScore;
    if (dto.awayScore !== undefined) update.awayScore = dto.awayScore;
    await this.matchRepo.update(matchId, update);
    return this.matchRepo.findOne({ where: { id: matchId }, relations: ['homeTeam', 'awayTeam'] });
  }

  async settleMatch(matchId: string) {
    const match = await this.matchRepo.findOne({ where: { id: matchId } });
    if (!match) throw new NotFoundException('Match not found');
    if (match.status !== MatchStatus.FINISHED)
      throw new BadRequestException('Match is not finished yet');
    if (match.homeScore === null || match.awayScore === null)
      throw new BadRequestException('Match has no final score');

    const predictions = await this.predRepo.find({ where: { matchId } });
    for (const pred of predictions) {
      const raw = this.calculatePoints(
        pred.homeScore, pred.awayScore,
        match.homeScore!, match.awayScore!,
      );
      const pts = pred.isRevised ? Math.floor(raw / 2) : raw;
      await this.predRepo.update(pred.id, { points: pts });
    }
    return { matchId, settled: predictions.length };
  }

  async settleAll() {
    const finished = await this.matchRepo.find({ where: { status: MatchStatus.FINISHED } });
    let total = 0;
    for (const match of finished) {
      if (match.homeScore !== null && match.awayScore !== null) {
        const preds = await this.predRepo.find({ where: { matchId: match.id } });
        for (const pred of preds) {
          const raw = this.calculatePoints(
            pred.homeScore, pred.awayScore,
            match.homeScore!, match.awayScore!,
          );
          const pts = pred.isRevised ? Math.floor(raw / 2) : raw;
          await this.predRepo.update(pred.id, { points: pts });
        }
        total += preds.length;
      }
    }
    return { settled: total };
  }

  private calculatePoints(predHome: number, predAway: number, realHome: number, realAway: number): number {
    if (predHome === realHome && predAway === realAway) return 10;
    const predOutcome = Math.sign(predHome - predAway);
    const realOutcome = Math.sign(realHome - realAway);
    const correctOutcome = predOutcome === realOutcome;
    const homeMatch = predHome === realHome;
    const awayMatch = predAway === realAway;
    if (correctOutcome && predOutcome === 0) return 7;
    if (correctOutcome && (homeMatch || awayMatch)) return 5;
    if (correctOutcome) return 3;
    if (homeMatch || awayMatch) return 1;
    return 0;
  }

  async getUsers() {
    return this.userRepo.find({ order: { createdAt: 'ASC' } });
  }

  async setUserRole(userId: string, role: UserRole) {
    const user = await this.userRepo.findOne({ where: { id: userId } });
    if (!user) throw new NotFoundException('User not found');
    await this.userRepo.update(userId, { role });
    return this.userRepo.findOne({ where: { id: userId } });
  }
}
