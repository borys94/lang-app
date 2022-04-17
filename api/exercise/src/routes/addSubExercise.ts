import express, { Request, Response } from "express";
import { body } from "express-validator";

import { requireAuth, validateRequest, BadRequestError } from "@lang-common/common";
import {Exercise} from "../db/exercise";
import {SubExercise} from "../db/subExercise";
import subExerciseValidator from "../middlewares/subExerciseValidator";

const router = express.Router();

router.post(
  "/exercises/:exerciseId",
  requireAuth,
  subExerciseValidator,
  async (req: Request, res: Response) => {
    const { text, title, answers } = req.body;

    const exercise = await Exercise.findById(req.params.exerciseId)
    if (!exercise) {
      throw new BadRequestError("Exercise does not exist")
    }

    const subExercise = SubExercise.build({
      text,
      title,
      answers,
      exerciseId: exercise._id
    })
    await subExercise.save();
    res.status(201).send({
      subExercise
    });
  }
);

export { router as addSubExerciseRouter };
