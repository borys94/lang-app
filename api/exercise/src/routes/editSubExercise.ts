import express from "express";

import { requireAuth, currentUser, NotAuthorizedError, BadRequestError } from "@lang-common/common";
import {Exercise} from "../db/exercise";
import {SubExercise} from "../db/subExercise";

const router = express.Router();

router.put("/exercises/:exerciseId/subExercise/:subExerciseId", currentUser, requireAuth, async (req, res) => {
  const { text, title, answers } = req.body;

  const exercise = await Exercise.findById(req.params.exerciseId);
  const subExercise = await SubExercise.findById(req.params.subExerciseId);
    if (!exercise || !subExercise) {
      throw new BadRequestError("Exercise does not exist")
    }

  subExercise.set("title", title);
  subExercise.set("text", text);
  subExercise.set("answers", answers);
  await subExercise.save();

  res.status(200).send({
    subExercise
  });
});

export { router as editSubExerciseRouter };
