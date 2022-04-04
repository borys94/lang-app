import express from 'express';
import { requireAuth, currentUser } from '../../middlewares';
import Training from "../../db/training";

const router = express.Router();

router.post('/training', currentUser, requireAuth, async (req, res) => {
  const { wordId, sentenceId } = req.body;
  const date = new Date();
  date.setHours(0,0,0,0);
  if (wordId) {
    await Training.addWord(wordId, date.toISOString())
  } else {
    await Training.addSentence(sentenceId, date.toISOString())
  }
  res.status(200).send({});
});

export { router as addToTrainingRouter };
