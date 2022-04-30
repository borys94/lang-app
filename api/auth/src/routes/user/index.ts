import express from 'express';

import { currentUserRouter } from './current-user';
import { signinRouter } from './signin';
import { signoutRouter } from './signout';
import { signupRouter } from './signup';

const router = express.Router();

router.use('/api/users/', [
  currentUserRouter,
  signinRouter,
  signoutRouter,
  signupRouter
]);

export { router as userRouter };
