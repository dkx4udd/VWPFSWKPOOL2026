import { Controller, Get, Post, Param, Body, UseGuards } from '@nestjs/common';
import { PredictionsService } from './predictions.service';
import { UpsertPredictionDto } from './dto/upsert-prediction.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { CurrentUser } from '../auth/decorators/current-user.decorator';
import { Roles } from '../auth/decorators/roles.decorator';
import { UserRole } from '../../infrastructure/database/entities/user.entity';

@Controller('predictions')
@UseGuards(JwtAuthGuard)
export class PredictionsController {
  constructor(private predictionsService: PredictionsService) {}

  @Get('my')
  myPredictions(@CurrentUser() user: { id: string }) {
    return this.predictionsService.findForUser(user.id);
  }

  @Get('stats')
  stats() {
    return this.predictionsService.getStats();
  }

  @Get('ai')
  aiPredictions() {
    return this.predictionsService.getAiPredictions();
  }

  @Post('match/:matchId')
  upsert(
    @CurrentUser() user: { id: string },
    @Param('matchId') matchId: string,
    @Body() dto: UpsertPredictionDto,
  ) {
    return this.predictionsService.upsert(user.id, matchId, dto);
  }

  @Post('match/:matchId/revise')
  revise(
    @CurrentUser() user: { id: string },
    @Param('matchId') matchId: string,
    @Body() dto: UpsertPredictionDto,
  ) {
    return this.predictionsService.revise(user.id, matchId, dto);
  }

  @Post('match/:matchId/settle')
  @UseGuards(RolesGuard)
  @Roles(UserRole.ADMIN)
  settle(@Param('matchId') matchId: string) {
    return this.predictionsService.settleMatch(matchId);
  }
}
