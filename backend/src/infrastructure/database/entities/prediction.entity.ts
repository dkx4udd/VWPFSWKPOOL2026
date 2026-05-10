import {
  Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn,
  CreateDateColumn, UpdateDateColumn, Unique,
} from 'typeorm';
import { User } from './user.entity';
import { Match } from './match.entity';

@Entity('predictions')
@Unique(['userId', 'matchId'])
export class Prediction {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ManyToOne(() => User, { onDelete: 'CASCADE' })
  @JoinColumn({ name: 'user_id' })
  user: User;

  @Column({ type: 'uuid', name: 'user_id' })
  userId: string;

  @ManyToOne(() => Match, (m) => m.predictions, { onDelete: 'CASCADE' })
  @JoinColumn({ name: 'match_id' })
  match: Match;

  @Column({ type: 'uuid', name: 'match_id' })
  matchId: string;

  @Column({ type: 'int' })
  homeScore: number;

  @Column({ type: 'int' })
  awayScore: number;

  @Column({ nullable: true, type: 'int' })
  points: number | null;

  @CreateDateColumn({ type: 'timestamptz' })
  createdAt: Date;

  @UpdateDateColumn({ type: 'timestamptz' })
  updatedAt: Date;
}
