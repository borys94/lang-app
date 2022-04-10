import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';

import Words from "../db/words";

const router = express.Router();

router.get('/lessons/:lessonId/words', currentUser, requireAuth, async (req, res) => {
  const words = await Words.getByLessonId(req.params.lessonId);
  res.status(200).send({
    words
  });
});

export { router as getWordsRouter };
