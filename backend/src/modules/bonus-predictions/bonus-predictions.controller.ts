import { Controller, Get, Post, Body, UseGuards } from '@nestjs/common';
import { BonusPredictionsService } from './bonus-predictions.service';
import { SetChampionDto } from './dto/set-champion.dto';
import { SetTopScorerDto } from './dto/set-top-scorer.dto';
import { SettleChampionDto, SettleTopScorerDto } from './dto/settle.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { CurrentUser } from '../auth/decorators/current-user.decorator';
import { Roles } from '../auth/decorators/roles.decorator';
import { UserRole } from '../../infrastructure/database/entities/user.entity';

@Controller('bonus-predictions')
@UseGuards(JwtAuthGuard)
export class BonusPredictionsController {
  constructor(private service: BonusPredictionsService) {}

  @Get('my')
  my(@CurrentUser() user: { id: string }) {
    return this.service.findForUser(user.id);
  }

  @Post('champion')
  setChampion(@CurrentUser() user: { id: string }, @Body() dto: SetChampionDto) {
    return this.service.setChampion(user.id, dto.teamId);
  }

  @Post('top-scorer')
  setTopScorer(@CurrentUser() user: { id: string }, @Body() dto: SetTopScorerDto) {
    return this.service.setTopScorer(user.id, dto.playerName);
  }

  @Post('settle/champion')
  @UseGuards(RolesGuard)
  @Roles(UserRole.ADMIN)
  settleChampion(@Body() dto: SettleChampionDto) {
    return this.service.settleChampion(dto.teamId);
  }

  @Post('settle/top-scorer')
  @UseGuards(RolesGuard)
  @Roles(UserRole.ADMIN)
  settleTopScorer(@Body() dto: SettleTopScorerDto) {
    return this.service.settleTopScorer(dto.playerName);
  }
}
