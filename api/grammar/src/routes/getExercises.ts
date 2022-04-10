import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';
import Exercise from "../db/exercises";

const router = express.Router();

router.get('/grammar/:grammarId/exercises', currentUser, requireAuth, async (req, res) => {
  const exercises = await Exercise.getByGrammarId(req.params.grammarId);
  for (let exercise of exercises) {
    (exercise as any).subExercises = await Exercise.getSubExercises(exercise.exercise_id)
  }
  res.status(200).send({
    exercises
  });
});

export { router as getExercisesRouter };
