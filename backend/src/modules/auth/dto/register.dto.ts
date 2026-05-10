import { IsEmail, IsString, MinLength, IsOptional, IsEnum } from 'class-validator';
import { PreferredLanguage } from '../../../infrastructure/database/entities/user.entity';

export class RegisterDto {
  @IsEmail()
  email: string;

  @IsString()
  @MinLength(8)
  password: string;

  @IsString()
  firstName: string;

  @IsString()
  lastName: string;

  @IsOptional()
  @IsEnum(PreferredLanguage)
  language?: PreferredLanguage;
}
