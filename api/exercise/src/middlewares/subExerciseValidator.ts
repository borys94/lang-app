import express, { Request, Response, NextFunction } from "express";
import { body } from "express-validator";
import { validateRequest } from "@lang-common/common";

const router = express.Router();

export default router.use(
  [
    body("title").not().isEmpty().withMessage("Title is required"),
    body("text")
      .not().isEmpty().withMessage("Text is required"),
    body("answers")
      .not().isEmpty().withMessage("Answers is required")
  ],
  validateRequest,
  async (req: Request, res: Response, next: NextFunction) => {
    next();
  }
);
