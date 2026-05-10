import { Controller, Get, Param, Query } from '@nestjs/common';
import { MatchesService } from './matches.service';
import { MatchPhase } from '../../infrastructure/database/entities/match.entity';

@Controller('matches')
export class MatchesController {
  constructor(private matchesService: MatchesService) {}

  @Get()
  findAll(@Query('phase') phase?: MatchPhase) {
    return this.matchesService.findAll(phase);
  }

  @Get('today')
  findToday() {
    return this.matchesService.findToday();
  }

  @Get('live')
  findLive() {
    return this.matchesService.findLive();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.matchesService.findOne(id);
  }
}
