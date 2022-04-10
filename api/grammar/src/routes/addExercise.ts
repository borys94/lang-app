import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';
import Exercise from "../db/exercises";

const router = express.Router();

router.post('/grammar/:grammarId/exercise', currentUser, requireAuth, async (req, res) => {
  await Exercise.addExercise(req.params.grammarId, req.body.name)
  const exercises = await Exercise.getByGrammarId(req.params.grammarId);
  res.status(200).send({
    exercises,
  });
});

export { router as addExerciseRouter };
