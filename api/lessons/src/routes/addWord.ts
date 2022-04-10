import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';
import Lessons from "../db/lessons";
import Words from "../db/words";

const router = express.Router();

router.post('/lessons/:lessonId', currentUser, requireAuth, async (req, res) => {
  const lesson = await Lessons.getById(req.params.lessonId);
  await Words.add(req.body.value, req.body.translated, req.params.lessonId, req.body.type);
  res.status(200).send({
    ...lesson,
    words: await Words.getByLessonId(req.params.lessonId),
  });
});

export { router as addWordRouter };
