import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Match, MatchPhase, MatchStatus } from '../../infrastructure/database/entities/match.entity';

@Injectable()
export class MatchesService {
  constructor(
    @InjectRepository(Match) private matchRepo: Repository<Match>,
  ) {}

  findAll(phase?: MatchPhase) {
    const where = phase ? { phase } : {};
    return this.matchRepo.find({
      where,
      relations: ['homeTeam', 'awayTeam'],
      order: { scheduledAt: 'ASC' },
    });
  }

  async findOne(id: string) {
    const match = await this.matchRepo.findOne({
      where: { id },
      relations: ['homeTeam', 'awayTeam'],
    });
    if (!match) throw new NotFoundException('Match not found');
    return match;
  }

  findToday() {
    const start = new Date();
    start.setHours(0, 0, 0, 0);
    const end = new Date();
    end.setHours(23, 59, 59, 999);

    return this.matchRepo
      .createQueryBuilder('match')
      .leftJoinAndSelect('match.homeTeam', 'homeTeam')
      .leftJoinAndSelect('match.awayTeam', 'awayTeam')
      .where('match.scheduledAt BETWEEN :start AND :end', { start, end })
      .orderBy('match.scheduledAt', 'ASC')
      .getMany();
  }

  findLive() {
    return this.matchRepo.find({
      where: { status: MatchStatus.LIVE },
      relations: ['homeTeam', 'awayTeam'],
      order: { scheduledAt: 'ASC' },
    });
  }
}
