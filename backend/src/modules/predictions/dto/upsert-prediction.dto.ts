import { IsInt, Min, Max } from 'class-validator';

export class UpsertPredictionDto {
  @IsInt()
  @Min(0)
  @Max(30)
  homeScore: number;

  @IsInt()
  @Min(0)
  @Max(30)
  awayScore: number;
}
