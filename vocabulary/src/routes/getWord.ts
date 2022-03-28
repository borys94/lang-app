import express, { Request, Response } from "express";
import { body } from "express-validator";
import { BadRequestError, requireAuth } from "@lang-common/common";
import { Vocabulary } from "../models/vocabulary";

const router = express.Router();

router.get(
  "/api/vocabulary/:wordId",
  requireAuth,
  async (req: Request, res: Response) => {
    const word = await Vocabulary.findById(req.params.wordId);
    if (!word) {
      throw new BadRequestError("The word does not exist");
    }
    res.status(200).send({ word });
  }
);

export { router as getWordRouter };
