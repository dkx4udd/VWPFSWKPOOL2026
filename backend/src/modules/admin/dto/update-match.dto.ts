import { IsOptional, IsInt, Min, IsEnum } from 'class-validator';
import { MatchStatus } from '../../../infrastructure/database/entities/match.entity';

export class UpdateMatchDto {
  @IsOptional() @IsEnum(MatchStatus)
  status?: MatchStatus;

  @IsOptional() @IsInt() @Min(0)
  homeScore?: number;

  @IsOptional() @IsInt() @Min(0)
  awayScore?: number;
}
