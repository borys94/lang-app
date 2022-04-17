import express from "express";

import { requireAuth, currentUser } from "@lang-common/common";
import {SubExercise} from "../db/subExercise";

const router = express.Router();

router.get("/exercises/:exerciseId/subExercise/:subExerciseId", currentUser, requireAuth, async (req, res) => {
  const subExercise = await SubExercise.findById(req.params.subExerciseId);

  res.status(200).send({
    subExercise
  });
});

export { router as getSubExerciseRouter };
