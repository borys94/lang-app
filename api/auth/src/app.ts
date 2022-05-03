import express from 'express';
import 'express-async-errors';
import { json } from 'body-parser';
import cors from 'cors';
import cookieSession from 'cookie-session';
import { NotFoundError } from './errors';
import { errorHandler, currentUser } from "./middlewares"

import { userRouter } from './routes/user';
import { wordsRouter } from './routes/words';
import { grammarRouter } from './routes/grammar';

const app = express();
app.set('trust proxy', 1);
app.use(json());
app.use(cors());
app.use(
  cookieSession({
    signed: false, 
    secure: false,//process.env.NODE_ENV !== 'test',
  })
);

app.use(currentUser);
app.use(userRouter);
app.use(wordsRouter);
app.use(grammarRouter);
// app.use(signupRouter);

app.all('*', async (req, res) => {
  throw new NotFoundError();
});

app.use(errorHandler);

export { app };
