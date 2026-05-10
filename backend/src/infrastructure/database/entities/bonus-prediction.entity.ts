import {
  Entity, PrimaryGeneratedColumn, Column, ManyToOne,
  JoinColumn, CreateDateColumn, UpdateDateColumn,
} from 'typeorm';
import { User } from './user.entity';
import { Team } from './team.entity';

export enum BonusPredictionType {
  CHAMPION = 'champion',
  TOP_SCORER = 'top_scorer',
}

@Entity('bonus_predictions')
export class BonusPrediction {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ type: 'uuid', name: 'user_id' })
  userId: string;

  @ManyToOne(() => User, { onDelete: 'CASCADE' })
  @JoinColumn({ name: 'user_id' })
  user: User;

  @Column({ type: 'enum', enum: BonusPredictionType })
  type: BonusPredictionType;

  @Column({ type: 'uuid', nullable: true, name: 'team_id' })
  teamId: string | null;

  @ManyToOne(() => Team, { nullable: true })
  @JoinColumn({ name: 'team_id' })
  team: Team | null;

  @Column({ nullable: true, type: 'text', name: 'player_name' })
  playerName: string | null;

  @Column({ nullable: true, type: 'int' })
  points: number | null;

  @CreateDateColumn({ type: 'timestamptz' })
  createdAt: Date;

  @UpdateDateColumn({ type: 'timestamptz' })
  updatedAt: Date;
}
