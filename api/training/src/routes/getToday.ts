import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';
import Training from "../db/training";

const router = express.Router();

router.get('/training/today', currentUser, requireAuth, async (req, res) => {
  const result = await Training.getToday(req.currentUser!.id)
  res.status(200).send(result);
});

export { router as getTodayTrainingRouter };
