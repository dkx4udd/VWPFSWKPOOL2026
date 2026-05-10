import { Injectable, ForbiddenException, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { BonusPrediction, BonusPredictionType } from '../../infrastructure/database/entities/bonus-prediction.entity';
import { Team } from '../../infrastructure/database/entities/team.entity';

const TOURNAMENT_START = new Date('2026-06-11T00:00:00Z');
export const CHAMPION_POINTS = 20;
export const TOP_SCORER_POINTS = 15;

@Injectable()
export class BonusPredictionsService {
  constructor(
    @InjectRepository(BonusPrediction) private bonusRepo: Repository<BonusPrediction>,
    @InjectRepository(Team) private teamRepo: Repository<Team>,
  ) {}

  private checkDeadline() {
    if (new Date() >= TOURNAMENT_START) {
      throw new ForbiddenException('Deadline voor bonus-voorspellingen is verstreken (11 juni 2026 00:00 UTC)');
    }
  }

  async setChampion(userId: string, teamId: string) {
    this.checkDeadline();
    const team = await this.teamRepo.findOne({ where: { id: teamId } });
    if (!team) throw new NotFoundException('Team niet gevonden');

    const existing = await this.bonusRepo.findOne({
      where: { userId, type: BonusPredictionType.CHAMPION },
    });
    if (existing) {
      await this.bonusRepo.update(existing.id, { teamId, points: null });
      return this.bonusRepo.findOne({ where: { id: existing.id }, relations: ['team'] });
    }
    const pred = this.bonusRepo.create({
      userId, type: BonusPredictionType.CHAMPION, teamId, points: null,
    });
    await this.bonusRepo.save(pred);
    return this.bonusRepo.findOne({ where: { id: pred.id }, relations: ['team'] });
  }

  async setTopScorer(userId: string, playerName: string) {
    this.checkDeadline();
    const existing = await this.bonusRepo.findOne({
      where: { userId, type: BonusPredictionType.TOP_SCORER },
    });
    if (existing) {
      await this.bonusRepo.update(existing.id, { playerName, points: null });
      return this.bonusRepo.findOne({ where: { id: existing.id } });
    }
    const pred = this.bonusRepo.create({
      userId, type: BonusPredictionType.TOP_SCORER, playerName, points: null,
    });
    return this.bonusRepo.save(pred);
  }

  findForUser(userId: string) {
    return this.bonusRepo.find({ where: { userId }, relations: ['team'] });
  }

  async settleChampion(teamId: string) {
    const team = await this.teamRepo.findOne({ where: { id: teamId } });
    if (!team) throw new NotFoundException('Team niet gevonden');
    const preds = await this.bonusRepo.find({ where: { type: BonusPredictionType.CHAMPION } });
    for (const pred of preds) {
      const pts = pred.teamId === teamId ? CHAMPION_POINTS : 0;
      await this.bonusRepo.update(pred.id, { points: pts });
    }
    return { settled: preds.length, teamId, teamName: team.nameNl };
  }

  async settleTopScorer(playerName: string) {
    const normalized = playerName.toLowerCase().trim();
    const preds = await this.bonusRepo.find({ where: { type: BonusPredictionType.TOP_SCORER } });
    for (const pred of preds) {
      const pts = pred.playerName?.toLowerCase().trim() === normalized ? TOP_SCORER_POINTS : 0;
      await this.bonusRepo.update(pred.id, { points: pts });
    }
    return { settled: preds.length, playerName };
  }

  async getUserBonusPoints(userId: string): Promise<number> {
    const preds = await this.bonusRepo.find({ where: { userId } });
    return preds.reduce((sum, p) => sum + (p.points ?? 0), 0);
  }

  async getAllBonusPointsMap(): Promise<Map<string, number>> {
    const rows = await this.bonusRepo
      .createQueryBuilder('bp')
      .select('bp.userId', 'userId')
      .addSelect('SUM(bp.points)', 'bonusPoints')
      .where('bp.points IS NOT NULL')
      .groupBy('bp.userId')
      .getRawMany();
    return new Map(rows.map(r => [r.userId, parseInt(r.bonusPoints ?? '0', 10)]));
  }
}
