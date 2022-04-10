import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';
// import Lessons from "../../db/lessons";
// import Sentences from "../../db/sentences";
// import Vocabulary from "../../db/vocabulary";

const router = express.Router();

router.post('/lessons/:lessonId/sentence', currentUser, requireAuth, async (req, res) => {
  // const lesson = await Lessons.getById(req.params.lessonId);
  // await Sentences.add(req.body.value, req.body.translated, req.params.lessonId)
  // res.status(200).send({
  //   lesson,
  //   vocabulary: await Vocabulary.getByLessonId(req.params.lessonId),
  //   sentences: await Sentences.getByLessonId(req.params.lessonId),
  // });
});

export { router as addSentenceToLesson };
