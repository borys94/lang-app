import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';
import Examples from "../db/examples";

const router = express.Router();

router.post('/grammar/:grammarId/examples', currentUser, requireAuth, async (req, res) => {
  await Examples.add(req.body.value, req.body.translated, req.params.grammarId)
  const grammar = await Examples.getByGrammarId(req.params.grammarId);
  res.status(200).send({
    grammar,
  });
});

export { router as addExampleRouter };
