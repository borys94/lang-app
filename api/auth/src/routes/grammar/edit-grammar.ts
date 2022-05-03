import express, {Response, Request} from 'express';

import { requireAdmin } from '../../middlewares';
import { NotFoundError } from "../../errors";
import database from "../../database";
import snakeToCamel from "../../helpers/snakeToCamel";
import grammarValidator from "./validators/grammar-validator";

const router = express.Router();

router.put(
  '/:grammarId',
  requireAdmin, 
  grammarValidator,
  async (req: Request, res: Response) => {
    const { name, lang, level, value } = req.body;

    const grammar = await database.findOne(
      "UPDATE grammar SET name = $1, lang = $2, level = $3, value = $4 WHERE grammar_id = $5 RETURNING *",
      [name, lang, level, value, req.params.grammarId]
    );
    if (!grammar) {
      throw new NotFoundError("Grammar not found")
    }
    res.status(200).send(snakeToCamel(grammar));
  }
);

export { router as editGrammarRouter };
