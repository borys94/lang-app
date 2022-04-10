import express from 'express';
import axios from "axios"

import { requireAuth, currentUser, NotAuthorizedError, BadRequestError } from '@lang-common/common';
import Training from "../db/training";
import Words from "../db/words";

const router = express.Router();

router.post('/training', currentUser, requireAuth, async (req, res) => {
  const { externalId, userId, lang, type } = req.body;
  if (+userId !== req.currentUser!.id) {
    throw new NotAuthorizedError();
  }

  let training = await Training.getByUserId(userId);
  if (!training) {
    training = await Training.add(userId, lang);
  }
  let word;
  let example;
  try {
    if (type === "grammar") {
      example = (await axios.get(
        `http://grammar_service:3000/grammar/examples/${externalId}`, {
          headers: {
            cookie: req.headers.cookie as any
          }
        }
      )).data.example;
      console.log(example)
    } else {
      word = (await axios.get(
        `http://lesson_service:3000/lessons/words/${externalId}`, {
          headers: {
            cookie: req.headers.cookie as any
          }
        }
      )).data.word;
    }
    
  } catch (error: any) {
    throw new BadRequestError("Something went wrong");
  }

  if (await Words.getWord(training.training_id, externalId, type)) {
    throw new BadRequestError("Cannot add the word second time");
  }

  if (type === "grammar") {
    console.log(example)
    try {
      await Words.add(
        example.value,
        example.translated,
        example.grammar_id,
        training.training_id,
        externalId,
        req.body.type,
      );
    } catch(e) {
      console.log(e)
    }

  } else {
    await Words.add(
      word.value,
      word.translated,
      word.lesson_id,
      training.training_id,
      externalId,
      req.body.type,
    );
  }


  res.status(200).send({});
});

export { router as addWordRouter };
