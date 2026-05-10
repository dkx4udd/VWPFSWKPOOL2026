import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.setGlobalPrefix('api/v1');
  app.useGlobalPipes(new ValidationPipe({ whitelist: true, transform: true }));
  app.enableCors({
    origin: [
      'https://vwpfswkpool.jenieuweauto.nl',
      'http://localhost:3000',
    ],
    credentials: true,
  });
  const port = process.env.PORT ?? 3003;
  await app.listen(port);
  console.log(`WK Pool backend running on port ${port} [${process.env.NODE_ENV ?? 'development'}]`);
}
bootstrap();
