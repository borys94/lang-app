import express from "express";

import { requireAuth, currentUser, NotAuthorizedError, BadRequestError } from "@lang-common/common";
import {SubExercise} from "../db/subExercise";

const router = express.Router();

router.get("/exercises/:exerciseId/subExercise", currentUser, requireAuth, async (req, res) => {
  const subExercises = await SubExercise.find({exerciseId: req.params.exerciseId});

  res.status(200).send({
    subExercises
  });
});

export { router as getSubExercisesRouter };
