import express, { Request, Response, NextFunction } from "express";
import { body } from "express-validator";
import { validateRequest } from "../../../middlewares";

const router = express.Router();

export default router.use(
  [
    body('name').notEmpty().withMessage('Grammar name must be valid'),
    body('lang')
      .trim()
      .notEmpty()
      .isIn(['Spanish', 'English', 'German'])
      .withMessage('You must supply a password'),
    body('level')
      .notEmpty()
      .isIn(['A1', 'A2', 'B1', 'B2', 'C1', 'C2'])
      .withMessage('level must be in (A1, A2, B1, B2, C1, C2)'),
    body('value')
      .notEmpty()
      .withMessage('Grammar value is required'),
  ],
  validateRequest,
  async (req: Request, res: Response, next: NextFunction) => {
    next();
  }
);
