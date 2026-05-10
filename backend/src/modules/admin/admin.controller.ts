import { Controller, Get, Patch, Post, Body, Param, UseGuards } from '@nestjs/common';
import { AdminService } from './admin.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/decorators/roles.decorator';
import { UserRole } from '../../infrastructure/database/entities/user.entity';
import { UpdateMatchDto } from './dto/update-match.dto';

@Controller('admin')
@UseGuards(JwtAuthGuard, RolesGuard)
@Roles(UserRole.ADMIN)
export class AdminController {
  constructor(private adminService: AdminService) {}

  @Get('stats')
  getStats() { return this.adminService.getStats(); }

  @Get('matches')
  getMatches() { return this.adminService.getMatches(); }

  // settle-all must be declared before :id to avoid route conflict
  @Post('matches/settle-all')
  settleAll() { return this.adminService.settleAll(); }

  @Patch('matches/:id')
  updateMatch(@Param('id') id: string, @Body() dto: UpdateMatchDto) {
    return this.adminService.updateMatch(id, dto);
  }

  @Post('matches/:id/settle')
  settleMatch(@Param('id') id: string) {
    return this.adminService.settleMatch(id);
  }

  @Get('users')
  getUsers() { return this.adminService.getUsers(); }

  @Patch('users/:id/role')
  setUserRole(@Param('id') id: string, @Body() body: { role: UserRole }) {
    return this.adminService.setUserRole(id, body.role);
  }
}
