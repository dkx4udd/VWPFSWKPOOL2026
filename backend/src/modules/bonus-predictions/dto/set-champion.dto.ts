import { IsUUID } from 'class-validator';

export class SetChampionDto {
  @IsUUID()
  teamId: string;
}
