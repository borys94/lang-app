import express from 'express';
import 'express-async-errors';
import { json } from 'body-parser';
import cors from 'cors';
import cookieSession from 'cookie-session';
import { NotFoundError } from './errors';
import { errorHandler } from './middlewares';

import { currentUserRouter } from './routes/auth/current-user';
// import { signinRouter } from './routes/signin';
// import { signoutRouter } from './routes/signout';
import { signupRouter } from './routes/auth/signup';

import { getAllLessonsRouter } from './routes/lessons/getAll';
import { addLessonRouter } from './routes/lessons/add';
import { getLessonRouter } from './routes/lessons/get';
import { addWordToLesson } from './routes/lessons/addWord';
import { addSentenceToLesson } from './routes/lessons/addSentence';

import { removeWordRouter } from "./routes/vocabulary/remove";
import { addToTrainingRouter } from "./routes/training/add";
import { updateTrainingRouter } from "./routes/training/update";
import { getTodayTrainingRouter } from "./routes/training/getToday";

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

app.use(currentUserRouter);
// app.use(signinRouter);
// app.use(signoutRouter);
app.use(signupRouter);

app.use(getAllLessonsRouter);
app.use(addLessonRouter);
app.use(getLessonRouter);
app.use(addWordToLesson);
app.use(addSentenceToLesson);

app.use(removeWordRouter);

app.use(addToTrainingRouter);
app.use(updateTrainingRouter);
app.use(getTodayTrainingRouter);


app.all('*', async (req, res) => {
  throw new NotFoundError();
});

app.use(errorHandler);

export { app };
