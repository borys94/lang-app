import express from 'express';
import { currentUser, requireAuth } from '../../middlewares';

import { addWordCategoryRouter } from './add-word-category';
import { addWordRouter } from './add-word';
import { getWordCategoriesRouter } from './get-word-categories';
import { getWordRouter } from './get-word';
import { deleteWordCategoriesRouter } from "./delete-word-category";
import { deleteWordRouter } from "./delete-word";

const router = express.Router();

router.use('/api/words/', requireAuth, [
  addWordCategoryRouter,
  addWordRouter,
  getWordCategoriesRouter,
  getWordRouter,
  deleteWordCategoriesRouter,
  deleteWordRouter
]);

export { router as wordsRouter };
