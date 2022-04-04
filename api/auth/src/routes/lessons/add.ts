import express, {Response, Request} from 'express';
import { body } from 'express-validator';

import { requireAuth, currentUser, validateRequest } from '../../middlewares';
import Lessons from "../../db/lessons";

const router = express.Router();

router.post(
  '/lessons',
  currentUser,
  requireAuth, 
  [
    body('name').notEmpty().withMessage('Lesson name must be valid'),
    body('lang')
      .trim()
      .notEmpty()
      .isIn(['Spanish', 'English', 'German'])
      .withMessage('You must supply a password'),
    body('level')
      .notEmpty()
      .isIn(['A1', 'A2', 'B1', 'B2', 'C1', 'C2'])
      .withMessage('level must be in (A1, A2, B1, B2, C1, C2)'),
  ],
  validateRequest,
  async (req: Request, res: Response) => {
    const lesson = await Lessons.add(req.body.name, req.body.lang, req.body.level);
    res.status(200).send(lesson);
  }
);

export { router as addLessonRouter };
