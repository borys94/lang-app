import express, { Request, Response } from 'express';
import { body, query } from 'express-validator';
import { validateRequest } from '../../middlewares';
import { BadRequestError } from '../../errors';

import database from "../../database";
import snakeToCamel from "../../helpers/snakeToCamel";

const router = express.Router();

router.get(
  '/categories',
  [
    query('lang')
      .isIn(["Spanish", "English", "German"])
      .withMessage('Lang must be defined'),
  ],
  validateRequest,
  async (req: Request, res: Response) => { 
    const words = await database.findMany(
      "select * from word_categories WHERE lang = $1",
      [req.query.lang]
    );
    res.status(200).send(snakeToCamel(words));
  }
);

export { router as getWordCategoriesRouter };
