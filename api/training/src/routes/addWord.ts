import express from 'express';
import { requireAuth, currentUser } from '../../../common/middlewares';
import { NotAuthorizedError } from '../../../common/errors';
import Training from "../db/training";

const router = express.Router();

router.post('/training/:trainingId', currentUser, requireAuth, async (req, res) => {
  const { wordId } = req.body;
  const { trainingId } = req.params;

  const training = await Training.getById(trainingId);
  if (!req.currentUser || training.user_id !== req.currentUser.id) {
    throw new NotAuthorizedError();
  }

  // if (wordId) {
  //   await Training.addWord(wordId, date.toISOString())
  // } else {
  //   await Training.addSentence(sentenceId, date.toISOString())
  // }
  res.status(200).send({});
});

export { router as addWordRouter };
