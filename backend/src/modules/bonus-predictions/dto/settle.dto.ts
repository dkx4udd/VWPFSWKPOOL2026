import { IsUUID, IsString, MinLength } from 'class-validator';

export class SettleChampionDto {
  @IsUUID()
  teamId: string;
}

export class SettleTopScorerDto {
  @IsString()
  @MinLength(2)
  playerName: string;
}
