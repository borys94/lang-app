import express from 'express';
import 'express-async-errors';
import { json } from 'body-parser';
import cors from 'cors';
import cookieSession from 'cookie-session';
import { errorHandler, NotFoundError } from '@lang-common/common';

import { getLessonsRouter } from './routes/getLessons';
import { addLessonRouter } from './routes/addLesson';
import { getWordsRouter } from './routes/getWords';
import { addWordRouter } from './routes/addWord';
import { addSentenceToLesson } from './routes/addSentence';
import { getWordRouter } from './routes/getWord';

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

app.use(getLessonsRouter);
app.use(addLessonRouter);
app.use(getWordsRouter);
app.use(addWordRouter);
app.use(addSentenceToLesson);
app.use(getWordRouter);

app.all('*', async (req, res) => {
  throw new NotFoundError();
});

app.use(errorHandler);

export { app };
