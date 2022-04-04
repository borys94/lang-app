import express from 'express';
import { requireAuth, currentUser } from '../../middlewares';
import Training from "../../db/training";

const router = express.Router();

const days = [[1, 3, 7], [2, 14, 30], [3, 20, 90]]

router.put('/training/:trainingId', currentUser, requireAuth, async (req, res) => {
  const note = +req.body.note - 1;
  const current = await Training.getById(req.params.trainingId);
  const lastNote = current.lastNote;

  const next = days[lastNote || 0][note]
  const nextDate = new Date();
  nextDate.setDate(nextDate.getDate() + next);
  nextDate.setHours(0, 0, 0, 0);
  console.log(
    req.params.trainingId,
    nextDate.toISOString(),
    note
  )
  await Training.update(req.params.trainingId, nextDate.toISOString(), note)

  res.status(200).send({});
});

export { router as updateTrainingRouter };
