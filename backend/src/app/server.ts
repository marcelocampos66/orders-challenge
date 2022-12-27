import 'reflect-metadata';
import 'dotenv/config';
import '../common/container';
import App from './app';
import { PORT } from './config/envs';

const serverPort = Number(PORT);


(async () => {
  const server = new App(serverPort);
  server.startServer();
})().catch(console.error);
