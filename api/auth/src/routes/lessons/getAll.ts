import express from 'express';
import { requireAuth, currentUser } from '../../middlewares';
import Lessons from "../../db/lessons";

const router = express.Router();

router.get('/lessons', currentUser, requireAuth, async (req, res) => {
  const lessons = await Lessons.getAll();
  res.status(200).send(lessons);
});

export { router as getAllLessonsRouter };
