import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';
import Exercise from "../db/exercises";

const router = express.Router();

router.put('/grammar/:grammarId/exercise/:exerciseId', currentUser, requireAuth, async (req, res) => {
  console.log(req.params.exerciseId, req.body.name)
  await Exercise.editExercise(req.params.exerciseId, req.body.name)
  res.status(200).send({});
});

export { router as editExerciseRouter };
