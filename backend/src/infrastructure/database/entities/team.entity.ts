import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { Match } from './match.entity';

export enum WorldCupGroup {
  A = 'A', B = 'B', C = 'C', D = 'D', E = 'E', F = 'F',
  G = 'G', H = 'H', I = 'I', J = 'J', K = 'K', L = 'L',
}

@Entity('teams')
export class Team {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ unique: true })
  nameNl: string;

  @Column({ unique: true })
  nameEn: string;

  @Column({ length: 2, unique: true })
  isoCode: string;

  @Column({ nullable: true, type: 'text' })
  flagEmoji: string | null;

  @Column({ type: 'enum', enum: WorldCupGroup, nullable: true })
  group: WorldCupGroup | null;

  @Column({ default: false })
  eliminated: boolean;

  @OneToMany(() => Match, (m) => m.homeTeam)
  homeMatches: Match[];

  @OneToMany(() => Match, (m) => m.awayTeam)
  awayMatches: Match[];
}
