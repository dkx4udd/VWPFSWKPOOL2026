import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AdminController } from './admin.controller';
import { AdminService } from './admin.service';
import { Match } from '../../infrastructure/database/entities/match.entity';
import { Prediction } from '../../infrastructure/database/entities/prediction.entity';
import { User } from '../../infrastructure/database/entities/user.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Match, Prediction, User])],
  controllers: [AdminController],
  providers: [AdminService],
})
export class AdminModule {}
