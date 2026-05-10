import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ThrottlerModule } from '@nestjs/throttler';
import databaseConfig from './config/database.config';
import { AuthModule } from './modules/auth/auth.module';
import { MatchesModule } from './modules/matches/matches.module';
import { PredictionsModule } from './modules/predictions/predictions.module';
import { RankingsModule } from './modules/rankings/rankings.module';
import { BonusPredictionsModule } from './modules/bonus-predictions/bonus-predictions.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: '../.env.staging',
      load: [databaseConfig],
    }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: (config: ConfigService) => config.get('database')!,
      inject: [ConfigService],
    }),
    ThrottlerModule.forRoot([{ ttl: 60000, limit: 100 }]),
    AuthModule,
    MatchesModule,
    PredictionsModule,
    RankingsModule,
    BonusPredictionsModule,
  ],
})
export class AppModule {}
