import express, {Response, Request} from 'express';

import { requireAdmin } from '../../middlewares';
import { NotFoundError } from '../../errors';
import database from "../../database";

const router = express.Router();

router.delete(
  '/:grammarId',
  requireAdmin, 
  async (req: Request, res: Response) => {
    const grammar = await database.findOne(
      "SELECT * FROM grammar WHERE grammar_id = $1",
      [req.params.grammarId]
    );
    if (!grammar) {
      throw new NotFoundError("Grammar not found");
    }
    await database.findOne(
      "DELETE FROM grammar WHERE grammar_id = $1 RETURNING *",
      [req.params.grammarId]
    );
    res.sendStatus(200);
  }
);

export { router as deleteGrammarRouter };
