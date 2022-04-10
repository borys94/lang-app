import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';
import Exercise from "../db/exercises";

const router = express.Router();

router.put('/grammar/:grammarId/exercise/:exerciseId/sub/:subExerciseId', currentUser, requireAuth, async (req, res) => {
  await Exercise.editSubExercise(req.params.subExerciseId, req.body.value, req.body.answers)
  res.status(200).send({});
});

export { router as editSubExerciseRouter };
