import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';
import Examples from "../db/examples";

const router = express.Router();

router.get('/grammar/examples/:exampleId', currentUser, requireAuth, async (req, res) => {
  const example = await Examples.getById(req.params.exampleId);
  res.status(200).send({
    example,
  });
});

export { router as getExampleRouter };
