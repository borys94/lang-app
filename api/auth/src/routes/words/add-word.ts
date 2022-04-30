import express, { Request, Response } from 'express';
import { body } from 'express-validator';
import { validateRequest, requireAuth } from '../../middlewares';

import database from "../../database";
import snakeToCamel from "../../helpers/snakeToCamel";

const router = express.Router();

router.post(
  '/',
  requireAuth,
  [
    body('value').notEmpty().withMessage('Value field cannot be empty'),
    body('translated')
      .trim()
      .notEmpty()
      .withMessage('Translated field cannot be empty'),
    body('wordCategoryId')
      .notEmpty()
      .withMessage('level must be in (A1, A2, B1, B2, C1, C2)'),
  ],
  validateRequest,
  async (req: Request, res: Response) => {
    const { value, translated, wordCategoryId } = req.body;

    const wordCategory = await database.findOne(
      "insert into words (value, translated, word_category_id) values ($1, $2, $3) RETURNING *",
      [value, translated, wordCategoryId]
    );
    res.status(201).send(snakeToCamel(wordCategory));
  }
);

export { router as addWordRouter };
