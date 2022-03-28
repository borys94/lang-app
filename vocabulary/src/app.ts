import express from "express";
import "express-async-errors";
import { json } from "body-parser";
import cookieSession from "cookie-session";
import { errorHandler, NotFoundError, currentUser } from "@lang-common/common";

import { getWordRouter } from "./routes/getWord";
import { deleteWordRouter } from "./routes/deleteWord";
import { addWordRouter } from "./routes/addWord";
import { getWordsRouter } from "./routes/getWords";

const app = express();
app.set("trust proxy", true);
app.use(json());
app.use(
  cookieSession({
    signed: false,
    secure: process.env.NODE_ENV !== "test",
  })
);
app.use(currentUser);

app.use(getWordRouter);
app.use(deleteWordRouter);
app.use(addWordRouter);
app.use(getWordsRouter);

app.all("*", async (req, res) => {
  throw new NotFoundError();
});

app.use(errorHandler);

export { app };
