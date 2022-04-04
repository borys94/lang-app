import express from 'express';
import { requireAuth, currentUser } from '../../middlewares';
import Lessons from "../../db/lessons";
import Vocabulary from "../../db/vocabulary";

const router = express.Router();

router.post('/lessons/:lessonId/vocabulary', currentUser, requireAuth, async (req, res) => {
  const lesson = await Lessons.getById(req.params.lessonId);
  await Vocabulary.add(req.body.value, req.body.translated, req.params.lessonId)
  res.status(200).send({
    ...lesson,
    vocabulary: await Vocabulary.getByLessonId(req.params.lessonId),
    sentences: [],
  });
});

export { router as addWordToLesson };
