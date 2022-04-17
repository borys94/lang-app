import express, { Request, Response } from "express";
import { requireAuth } from "@lang-common/common";

import {Exercise} from "../db/exercise";
import exerciseValidator from "../middlewares/exerciseValidator";

const router = express.Router();

router.post(
  "/exercises",
  requireAuth,
  exerciseValidator,
  async (req: Request, res: Response) => {
    const { title, lang, level } = req.body;

    const exercise = Exercise.build({
      title,
      lang,
      level,
    });
    await exercise.save();

    res.status(201).send({
      exercise
    });
  }
);

export { router as addExerciseRouter };
