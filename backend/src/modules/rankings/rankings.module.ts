import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RankingsController } from './rankings.controller';
import { RankingsService } from './rankings.service';
import { Prediction } from '../../infrastructure/database/entities/prediction.entity';
import { BonusPrediction } from '../../infrastructure/database/entities/bonus-prediction.entity';
import { User } from '../../infrastructure/database/entities/user.entity';
import { AuthModule } from '../auth/auth.module';

@Module({
  imports: [
    TypeOrmModule.forFeature([Prediction, BonusPrediction, User]),
    AuthModule,
  ],
  controllers: [RankingsController],
  providers: [RankingsService],
})
export class RankingsModule {}
