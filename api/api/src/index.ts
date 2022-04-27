import { app } from './app';
import Database from "./database";

const start = async () => {
  if (!process.env.JWT_KEY) {
    throw new Error('JWT_KEY must be defined');
  }

  try {
    await Database.connect();
    console.log('Connected to PostgreSQL');
  } catch (err) {
    console.error(err);
  }

  app.listen(3000, () => {
    console.log('Listening on port 3000!!!!!!!!');
  });
};

start();
