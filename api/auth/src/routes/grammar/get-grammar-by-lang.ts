import express, {Response, Request} from 'express';

import database from "../../database";
import snakeToCamel from "../../helpers/snakeToCamel";

const router = express.Router();

router.get(
  '/',
  async (req: Request, res: Response) => {
    const grammar = await database.findMany(
      "SELECT * FROM grammar WHERE lang = $1",
      [req.query.lang]
    );
    res.status(200).send(snakeToCamel(grammar));
  }
);

export { router as getGrammarByLangRouter };
