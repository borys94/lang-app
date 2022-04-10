import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';

import Grammar from "../db/grammar";
import Examples from "../db/examples";

const router = express.Router();

router.get('/grammars/:grammarId', currentUser, requireAuth, async (req, res) => {
  const grammar = await Grammar.getById(req.params.grammarId);
  const examples = await Examples.getByGrammarId(req.params.grammarId)
  res.status(200).send({
    grammar: {
      ...grammar,
      examples
    },
  });
});

export { router as getGrammarRouter };
