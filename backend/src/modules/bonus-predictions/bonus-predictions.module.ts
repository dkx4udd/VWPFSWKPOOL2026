import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { BonusPredictionsController } from './bonus-predictions.controller';
import { BonusPredictionsService } from './bonus-predictions.service';
import { BonusPrediction } from '../../infrastructure/database/entities/bonus-prediction.entity';
import { Team } from '../../infrastructure/database/entities/team.entity';
import { AuthModule } from '../auth/auth.module';

@Module({
  imports: [
    TypeOrmModule.forFeature([BonusPrediction, Team]),
    AuthModule,
  ],
  controllers: [BonusPredictionsController],
  providers: [BonusPredictionsService],
  exports: [BonusPredictionsService],
})
export class BonusPredictionsModule {}
