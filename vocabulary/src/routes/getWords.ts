import express, { Request, Response } from "express";
import { requireAuth } from "@lang-common/common";
import { Vocabulary } from "../models/vocabulary";

const router = express.Router();

router.get(
  "/api/vocabulary",
  requireAuth,
  async (req: Request, res: Response) => {
    const words = await Vocabulary.find({});
    res.status(200).send({ words });
  }
);

export { router as getWordsRouter };
