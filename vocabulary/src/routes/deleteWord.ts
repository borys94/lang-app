import express, { Request, Response } from "express";
import { BadRequestError, requireAuth } from "@lang-common/common";
import { Vocabulary } from "../models/vocabulary";

const router = express.Router();

router.delete(
  "/api/vocabulary/:wordId",
  requireAuth,
  async (req: Request, res: Response) => {
    const word = await Vocabulary.findById(req.params.wordId);
    if (!word) {
      throw new BadRequestError("The word you trying delete does not exist");
    }
    await Vocabulary.deleteOne({ _id: req.body.wordId });
    res.sendStatus(200);
  }
);

export { router as deleteWordRouter };
