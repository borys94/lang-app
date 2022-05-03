import express, {Response, Request} from 'express';
import { body } from 'express-validator';

import { requireAdmin, currentUser, validateRequest } from '../../middlewares';
import database from "../../database";
import snakeToCamel from "../../helpers/snakeToCamel";
import grammarValidator from "./validators/grammar-validator";

const router = express.Router();

router.post(
  '/',
  requireAdmin, 
  grammarValidator,
  async (req: Request, res: Response) => {
    const { name, lang, level, value } = req.body;

    const grammar = await database.findOne(
      "insert into grammar (name, lang, level, value) values ($1, $2, $3, $4) RETURNING *",
      [name, lang, level, value]
    );
    res.status(201).send(snakeToCamel(grammar));
  }
);

export { router as addGrammarRouter };
