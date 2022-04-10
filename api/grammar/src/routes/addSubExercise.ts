import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';
import Exercise from "../db/exercises";

const router = express.Router();

router.post('/grammar/:grammarId/exercise/:exerciseId', currentUser, requireAuth, async (req, res) => {
  await Exercise.addSubExercise(req.params.exerciseId, req.body.value, req.body.answers)
  res.status(200).send({});
});

export { router as addSubExerciseRouter };
