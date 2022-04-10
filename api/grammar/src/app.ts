import express from 'express';
import 'express-async-errors';
import { json } from 'body-parser';
import cors from 'cors';
import cookieSession from 'cookie-session';
import { errorHandler, NotFoundError } from '@lang-common/common';

import { addExampleRouter } from './routes/addExample';
import { getExampleRouter } from './routes/getExample';
import { addGrammarRouter } from './routes/addGrammar';
import { getGrammarRouter } from './routes/getGrammar';
import { getGrammarsRouter } from './routes/getGrammars';
import { editGrammarRouter } from './routes/editGrammar';

import { getExercisesRouter } from './routes/getExercises';
import { addExerciseRouter } from './routes/addExercise';
import { addSubExerciseRouter } from './routes/addSubExercise';
import { editSubExerciseRouter } from './routes/editSubExercise';
import { editExerciseRouter } from './routes/editExercise';

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

app.use(addExampleRouter);
app.use(getExampleRouter);
app.use(addGrammarRouter);
app.use(getGrammarRouter);
app.use(getGrammarsRouter);
app.use(editGrammarRouter);

app.use(addExerciseRouter);
app.use(getExercisesRouter);
app.use(addSubExerciseRouter);
app.use(editSubExerciseRouter);
app.use(editExerciseRouter);

app.all('*', async (req, res) => {
  throw new NotFoundError();
});

app.use(errorHandler);

export { app };
