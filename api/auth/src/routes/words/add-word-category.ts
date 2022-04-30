import express, { Request, Response } from 'express';
import { body } from 'express-validator';
import { validateRequest } from '../../middlewares';

import database from "../../database";
import snakeToCamel from "../../helpers/snakeToCamel";

const router = express.Router();

router.post(
  '/categories',
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
    const { name, lang, level } = req.body;

    const wordCategory = await database.findOne(
      "insert into word_categories (name, lang, level) values ($1, $2, $3) RETURNING *",
      [name, lang, level]
    );
    res.status(201).send(snakeToCamel(wordCategory));
    
  }
);

export { router as addWordCategoryRouter };
