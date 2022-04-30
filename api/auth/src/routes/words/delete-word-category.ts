import express, { Request, Response } from 'express';
import { requireAuth } from '../../middlewares';
import { BadRequestError } from '../../errors';

import database from "../../database";

const router = express.Router();

router.delete(
  '/categories/:wordCategoryId',
  requireAuth,
  async (req: Request, res: Response) => {
    const wordCategory = await database.findOne(
      "SELECT * FROM word_categories WHERE word_category_id = $1",
      [req.params.wordCategoryId]
    );
    if (!wordCategory) {
      throw new BadRequestError("Word category not found")
    }
    await database.findOne(
      "DELETE FROM word_categories WHERE word_category_id = $1",
      [req.params.wordCategoryId]
    );
    res.sendStatus(200);
  }
);

export { router as deleteWordCategoriesRouter };
