import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';

import Words from "../db/words";

const router = express.Router();

router.get('/lessons/words/:wordId', currentUser, requireAuth, async (req, res) => {
  const word = await Words.getById(req.params.wordId);
  res.status(200).send({
    word
  });
});

export { router as getWordRouter };
