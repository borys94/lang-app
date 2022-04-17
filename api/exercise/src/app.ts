import express from "express";
import "express-async-errors";
import { json } from "body-parser";
import cors from "cors";
import cookieSession from "cookie-session";
import { errorHandler, NotFoundError, currentUser } from "@lang-common/common";

import { addExerciseRouter } from "./routes/addExercise";
import { addSubExerciseRouter } from "./routes/addSubExercise";

import { editExerciseRouter } from "./routes/editExercise";

import { getExerciseRouter } from "./routes/getExercise";
import { getExercisesRouter } from "./routes/getExercises";
import { getSubExerciseRouter } from "./routes/getSubExercise";
import { getSubExercisesRouter } from "./routes/getSubExercises";
import { editSubExerciseRouter } from "./routes/editSubExercise";

const app = express();
app.set("trust proxy", 1);
app.use(json());
app.use(cors());
app.use(
  cookieSession({
    signed: false, 
    secure: false,//process.env.NODE_ENV !== 'test',
  })
);

app.use(currentUser);

app.use(addExerciseRouter);
app.use(addSubExerciseRouter);

app.use(editExerciseRouter);

app.use(getExerciseRouter);
app.use(getExercisesRouter);
app.use(getSubExerciseRouter);
app.use(getSubExercisesRouter);
app.use(editSubExerciseRouter);

app.all("*", async (req, res) => {
  throw new NotFoundError();
});

app.use(errorHandler);

export { app };
