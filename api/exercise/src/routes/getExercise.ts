import express from "express";

import { BadRequestError } from "@lang-common/common";
import { Exercise } from "../db/exercise";

const router = express.Router();
router.get("/exercises/:exerciseId", async (req, res) => {
  const exercise = await Exercise.findById(req.params.exerciseId);
  if (!exercise) {
    throw new BadRequestError("Exercise does not exist")
  }
  
  res.status(200).send({
    exercise
  });
});

export { router as getExerciseRouter };
