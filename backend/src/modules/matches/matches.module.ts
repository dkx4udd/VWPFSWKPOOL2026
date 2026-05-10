import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MatchesController } from './matches.controller';
import { MatchesService } from './matches.service';
import { Match } from '../../infrastructure/database/entities/match.entity';
import { Team } from '../../infrastructure/database/entities/team.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Match, Team])],
  controllers: [MatchesController],
  providers: [MatchesService],
  exports: [MatchesService],
})
export class MatchesModule {}
