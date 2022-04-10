import express, {Response, Request} from 'express';
import { body } from 'express-validator';

import { requireAuth, currentUser, validateRequest } from '@lang-common/common';
import Grammar from "../db/grammar";

const router = express.Router();

router.post(
  '/grammars',
  currentUser,
  requireAuth, 
  [
    body('name').notEmpty().withMessage('Grammar name must be valid'),
    body('lang')
      .trim()
      .notEmpty()
      .isIn(['Spanish', 'English', 'German'])
      .withMessage('You must supply a password'),
    body('level')
      .notEmpty()
      .isIn(['A1', 'A2', 'B1', 'B2', 'C1', 'C2'])
      .withMessage('level must be in (A1, A2, B1, B2, C1, C2)'),
    body('value')
      .notEmpty()
      .withMessage('level must be in (A1, A2, B1, B2, C1, C2)'),
  ],
  validateRequest,
  async (req: Request, res: Response) => {
    const lesson = await Grammar.add(req.body.name, req.body.lang, req.body.level, req.body.value);
    res.status(200).send(lesson);
  }
);

export { router as addGrammarRouter };
