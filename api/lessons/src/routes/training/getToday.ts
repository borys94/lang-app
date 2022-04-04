import express from 'express';
import { requireAuth, currentUser } from '../../middlewares';
import Training from "../../db/training";

const router = express.Router();

const days = [[1, 3, 7], [2, 14, 30], [3, 20, 90]]

router.get('/training/today', currentUser, requireAuth, async (req, res) => {
  const result = await Training.getToday()
  res.status(200).send(result);
});

export { router as getTodayTrainingRouter };
