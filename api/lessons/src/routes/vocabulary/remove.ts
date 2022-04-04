import express from 'express';
import { requireAuth, currentUser } from '../../middlewares';
import Lessons from "../../db/lessons";
import Vocabulary from "../../db/vocabulary";

const router = express.Router();

router.delete('/vocabulary/:wordId', currentUser, requireAuth, async (req, res) => {
  await Vocabulary.remove(req.params.wordId);
  res.status(200).send({});
});

export { router as removeWordRouter };
