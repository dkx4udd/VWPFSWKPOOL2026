import { Controller, Get, UseGuards } from '@nestjs/common';
import { RankingsService } from './rankings.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { CurrentUser } from '../auth/decorators/current-user.decorator';

@Controller('rankings')
@UseGuards(JwtAuthGuard)
export class RankingsController {
  constructor(private rankingsService: RankingsService) {}

  @Get()
  leaderboard() {
    return this.rankingsService.getLeaderboard();
  }

  @Get('me')
  myRank(@CurrentUser() user: { id: string }) {
    return this.rankingsService.getUserRank(user.id);
  }
}
