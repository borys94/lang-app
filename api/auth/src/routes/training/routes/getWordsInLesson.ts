import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';

const router = express.Router();

const days = [[1, 3, 7], [2, 14, 30], [3, 20, 90]]

// router.get('/training/wordsInLessons', currentUser, requireAuth, async (req, res) => {
//   const data = await Training.getByUserId(+req.currentUser!.id)
//   console.log("user", +req.currentUser!.id)
//   if (!data) {
//     res.status(200).send([]);
//     return
//   }
//   console.log(req.query.isGrammar, Boolean(req.query.isGrammar))
//   const result = await Words.getWordsInLessons(data.training_id, req.query.isGrammar === "true")
//   res.status(200).send(result);
// });

// router.get('/training/wordsInLessons/:lessonId', currentUser, requireAuth, async (req, res) => {
//   let training = await Training.getByUserId(req.currentUser!.id);
//   if (!training) {
//     training = await Training.add(req.currentUser!.id, "Spanish");
//   }
//   const result = await Words.getWordsInLesson(training.training_id, +req.params.lessonId, req.query.isGrammar === "true")
//   res.status(200).send(result);
// });

export { router as getWordsInLessonRouter };
