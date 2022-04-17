import express from "express";

import {Exercise} from "../db/exercise";

const router = express.Router();
router.get("/exercises", async (req, res) => {
  const exercises = await Exercise.find({});

  res.status(200).send({
    exercises
  });
});

export { router as getExercisesRouter };
