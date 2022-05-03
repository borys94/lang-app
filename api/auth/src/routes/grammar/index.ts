import express from 'express';

import { addGrammarRouter } from './add-grammar';
import { addGrammarExerciseRouter } from './add-exercise';
import { editGrammarRouter } from './edit-grammar';
import { deleteGrammarRouter } from './delete-grammar';
import { getGrammarRouter } from "./get-grammar";
import { getGrammarByLangRouter } from "./get-grammar-by-lang";

const router = express.Router();

router.use('/api/grammar/', [
  addGrammarRouter,
  addGrammarExerciseRouter,
  editGrammarRouter,
  deleteGrammarRouter,
  getGrammarRouter,
  getGrammarByLangRouter
]);

export { router as grammarRouter };
