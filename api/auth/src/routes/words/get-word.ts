import express, { Request, Response } from 'express';
import { requireAuth } from '../../middlewares';
import { BadRequestError } from '../../errors';

import database from "../../database";
import snakeToCamel from "../../helpers/snakeToCamel";

const router = express.Router();

router.get(
  '/:wordId',
  requireAuth,
  async (req: Request, res: Response) => {
    const word = await database.findOne(
      "select * from words WHERE word_id = $1",
      [req.params.wordId]
    );

    if (!word) {
      throw new BadRequestError("Word not found")
    }
    res.status(200).send(snakeToCamel(word));
  }
);

export { router as getWordRouter };
