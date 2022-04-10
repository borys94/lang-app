import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';

import Lessons from "../db/lessons";

const router = express.Router();

router.get('/lessons', currentUser, requireAuth, async (req, res) => {
  const lang = req.query.lang as string;
  
  const lessons = await Lessons.getByLang(lang);
  res.status(200).send({lessons});
});

export { router as getLessonsRouter };
