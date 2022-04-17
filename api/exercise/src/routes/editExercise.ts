import express, { Request, Response } from "express";

import { requireAuth, BadRequestError } from "@lang-common/common";
import {Exercise} from "../db/exercise";
import exerciseValidator from "../middlewares/exerciseValidator";

const router = express.Router();

router.put(
  "/exercises/:exerciseId",
  requireAuth,
  exerciseValidator,
  async (req: Request, res: Response) => {
    const { title, level, lang } = req.body;

    const exercise = await Exercise.findById(req.params.exerciseId)
    if (!exercise) {
      throw new BadRequestError("Exercise does not exist")
    }

    exercise.set("title", title);
    exercise.set("level", level);
    exercise.set("lang", lang);
    await exercise.save();
    res.status(200).send({
      exercise
    });
  }
);

export { router as editExerciseRouter };
