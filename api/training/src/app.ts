import express from 'express';
import 'express-async-errors';
import { json } from 'body-parser';
import cors from 'cors';
import cookieSession from 'cookie-session';
import { errorHandler, NotFoundError } from '@lang-common/common';

import { addWordRouter } from "./routes/addWord";
import { updateTrainingRouter } from "./routes/update";
import { getTodayTrainingRouter } from "./routes/getToday";
import { getWordsInLessonRouter } from "./routes/getWordsInLesson";

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

app.use(addWordRouter);
app.use(updateTrainingRouter);
app.use(getTodayTrainingRouter);
app.use(getWordsInLessonRouter);

app.all('*', async (req, res) => {
  throw new NotFoundError();
});

app.use(errorHandler);

export { app };
