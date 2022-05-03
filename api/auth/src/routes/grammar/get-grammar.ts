import express, {Response, Request} from 'express';
import axios from 'axios';

import { NotFoundError } from '../../errors';
import database from "../../database";
import snakeToCamel from "../../helpers/snakeToCamel";

const router = express.Router();

router.get(
  '/:grammarId',
  async (req: Request, res: Response) => {
    const grammar = await database.findOne(
      "SELECT * FROM grammar WHERE grammar_id = $1",
      [req.params.grammarId]
    );
    if (!grammar) {
      throw new NotFoundError("Grammar not found")
    }
    const exercises = await database.findMany(
      "SELECT * FROM grammar_exercise WHERE grammar_id = $1",
      [req.params.grammarId]
    );
    grammar.exercises = exercises
    res.status(200).send(snakeToCamel(grammar));
  }
);

export { router as getGrammarRouter };
