import express, { Request, Response } from "express";
import { body } from "express-validator";
import { validateRequest, requireAuth } from "@lang-common/common";
import { Vocabulary } from "../models/vocabulary";

const router = express.Router();

router.post(
  "/api/vocabulary/words",
  requireAuth,
  [
    body("value").trim().notEmpty().withMessage("You must supply a value"),
    body("translated")
      .trim()
      .notEmpty()
      .withMessage("You must supply a translated field"),
  ],
  validateRequest,
  async (req: Request, res: Response) => {
    const word = Vocabulary.build({
      value: req.body.value,
      translated: req.body.translated,
    });
    await word.save();
    res.status(201).send({ word });
  }
);

export { router as addWordRouter };
