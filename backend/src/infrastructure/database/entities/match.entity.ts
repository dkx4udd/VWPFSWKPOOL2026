import {
  Entity, PrimaryGeneratedColumn, Column, ManyToOne, OneToMany,
  JoinColumn, CreateDateColumn, UpdateDateColumn,
} from 'typeorm';
import { Team } from './team.entity';
import { Prediction } from './prediction.entity';

export enum MatchPhase {
  GROUP = 'group',
  ROUND_OF_32 = 'round_of_32',
  ROUND_OF_16 = 'round_of_16',
  QUARTER_FINAL = 'quarter_final',
  SEMI_FINAL = 'semi_final',
  THIRD_PLACE = 'third_place',
  FINAL = 'final',
}

export enum MatchStatus {
  SCHEDULED = 'scheduled',
  LIVE = 'live',
  FINISHED = 'finished',
  POSTPONED = 'postponed',
}

@Entity('matches')
export class Match {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ nullable: true, type: 'text' })
  externalId: string | null;

  @ManyToOne(() => Team, (t) => t.homeMatches, { nullable: true })
  @JoinColumn({ name: 'home_team_id' })
  homeTeam: Team | null;

  @ManyToOne(() => Team, (t) => t.awayMatches, { nullable: true })
  @JoinColumn({ name: 'away_team_id' })
  awayTeam: Team | null;

  @Column({ nullable: true, type: 'text' })
  homeTeamPlaceholder: string | null;

  @Column({ nullable: true, type: 'text' })
  awayTeamPlaceholder: string | null;

  @Column({ type: 'timestamptz' })
  scheduledAt: Date;

  @Column({ type: 'enum', enum: MatchPhase })
  phase: MatchPhase;

  @Column({ nullable: true, type: 'text' })
  group: string | null;

  @Column({ nullable: true, type: 'text' })
  stadium: string | null;

  @Column({ nullable: true, type: 'text' })
  city: string | null;

  @Column({ type: 'enum', enum: MatchStatus, default: MatchStatus.SCHEDULED })
  status: MatchStatus;

  @Column({ nullable: true, type: 'int' })
  homeScore: number | null;

  @Column({ nullable: true, type: 'int' })
  awayScore: number | null;

  @Column({ nullable: true, type: 'int' })
  minutesPlayed: number | null;

  @OneToMany(() => Prediction, (p) => p.match)
  predictions: Prediction[];

  @CreateDateColumn({ type: 'timestamptz' })
  createdAt: Date;

  @UpdateDateColumn({ type: 'timestamptz' })
  updatedAt: Date;
}
