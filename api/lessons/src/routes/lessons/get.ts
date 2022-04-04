import express from 'express';
import { requireAuth, currentUser } from '../../middlewares';
import Lessons from "../../db/lessons";
import Vocabulary from "../../db/vocabulary";
import Sentences from "../../db/sentences";

const router = express.Router();

router.get('/lessons/:lessonId', currentUser, requireAuth, async (req, res) => {
  const lesson = await Lessons.getById(req.params.lessonId);
  res.status(200).send({
    lesson,
    vocabulary: await Vocabulary.getByLessonId(req.params.lessonId),
    sentences: await Sentences.getByLessonId(req.params.lessonId),
  });
});

export { router as getLessonRouter };
