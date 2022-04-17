import express, { Request, Response, NextFunction } from "express";
import { body } from "express-validator";
import { validateRequest } from "@lang-common/common";

const router = express.Router();

export default router.use(
  [
    body("title").not().isEmpty().withMessage("Title is required"),
    body("level")
      .not().isEmpty().withMessage("Level is required")
      .isIn(["A1", "A2", "B1", "B2", "C1", "C2"]).withMessage(""),
    body("lang")
      .not().isEmpty().withMessage("Lang is required")
      .isIn(["Spanish", "German"]).withMessage("Invalid lang provided"),
  ],
  validateRequest,
  async (req: Request, res: Response, next: NextFunction) => {
    next();
  }
);
