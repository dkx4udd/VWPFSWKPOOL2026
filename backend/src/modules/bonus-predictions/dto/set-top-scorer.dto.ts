import { IsString, MinLength, MaxLength } from 'class-validator';

export class SetTopScorerDto {
  @IsString()
  @MinLength(2)
  @MaxLength(100)
  playerName: string;
}
