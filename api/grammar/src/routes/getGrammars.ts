import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';

import Grammar from "../db/grammar";

const router = express.Router();

router.get('/grammars', currentUser, requireAuth, async (req, res) => {
  const lang = req.query.lang as string;
  
  const grammars = await Grammar.getByLang(lang);
  res.status(200).send({grammars});
});

export { router as getGrammarsRouter };
