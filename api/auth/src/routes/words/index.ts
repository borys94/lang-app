import express from 'express';
import { currentUser, requireAuth } from '../../middlewares';
// import { currentUser, requireAuth } from '@lang-common/common';

import { addWordCategoryRouter } from './add-word-category';
import { addWordRouter } from './add-word';
import { getWordCategoriesRouter } from './get-word-categories';
import { getWordRouter } from './get-word';
import { deleteWordCategoriesRouter } from "./delete-word-category";
import { deleteWordRouter } from "./delete-word";


const router = express.Router();

// router.use('/api/words/', currentUser);
// router.use('/api/words/', requireAuth);

router.use('/api/words/', currentUser, requireAuth, [
  addWordCategoryRouter,
  addWordRouter,
  getWordCategoriesRouter,
  getWordRouter,
  deleteWordCategoriesRouter,
  deleteWordRouter
]);

// router.use('/api/words/', addWordCategoryRouter);
// router.use('/api/words/', addWordRouter);
// router.use('/api/words/', getWordRouter);

export { router as wordsRouter };
