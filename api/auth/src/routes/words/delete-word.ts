import express, { Request, Response } from 'express';
import { requireAuth } from '../../middlewares';
import { BadRequestError } from '../../errors';

import database from "../../database";

const router = express.Router();

router.delete(
  '/:wordId',
  requireAuth,
  async (req: Request, res: Response) => {
    const word = await database.findOne(
      "SELECT * FROM words WHERE word_id = $1",
      [req.params.wordId]
    );
    if (!word) {
      throw new BadRequestError("Word not found")
    }
    await database.findOne(
      "DELETE FROM words WHERE word_id = $1",
      [req.params.wordId]
    );
    res.sendStatus(200);
  }
);

export { router as deleteWordRouter };
