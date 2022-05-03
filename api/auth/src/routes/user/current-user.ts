import express from 'express';
import { currentUser } from '../../middlewares';

const router = express.Router();

router.get('/currentuser', (req, res) => {
  res.send({ currentUser: req.currentUser || null });
});

export { router as currentUserRouter };
