import express from 'express';
import { requireAuth, currentUser } from '@lang-common/common';

import Training from "../db/training";
import Notes from "../db/notes";
import Words from "../db/words";

const router = express.Router();

const wsp = [0.5, 1, 2]

router.post('/training/:trainingId/notes/:wordId', currentUser, requireAuth, async (req, res) => {

  // const allWords = await Words.getAll();
  // for(let w of allWords) {
  //   const notes = await Notes.getByWordId(w.word_id);
  //   let days = 2;
  //   for(let n of notes) {
  //     days *= wsp[n.note];
  //   }
  //   days = Math.ceil(days);
  //   days = Math.max(1, Math.min(200, days));
  //   const nextDate = new Date();
  //   nextDate.setDate(nextDate.getDate() + days);
  //   const destinatedDate = formatDate(nextDate);
  //   console.log(w.word_id, destinatedDate)
  //   await Words.updateNextDate(w.word_id, destinatedDate);
    
  // }
  // res.status(200).send({});
  //   return

  const note = +req.body.note - 1;
  const wordId = +req.params.wordId;
  const current = await Training.getById(req.params.trainingId);
  const notes = await Notes.getByWordId(+req.params.wordId);
  console.log(notes)
  let days = 2 * wsp[+req.body.note - 1];
  for(let n of notes) {
    days *= wsp[n.note];
  }
  console.log(days)
  days = Math.ceil(days);
  days = Math.max(1, Math.min(200, days));
  const nextDate = new Date();
  nextDate.setDate(nextDate.getDate() + days);
  const destinatedDate = formatDate(nextDate);
  await Notes.add(wordId, note);
  await Words.updateNextDate(wordId, destinatedDate);

  res.status(200).send({});
});

export { router as updateTrainingRouter };

function padTo2Digits(num: number) {
  return num.toString().padStart(2, '0');
}

function formatDate(date: Date) {
  return [
    date.getFullYear(),
    padTo2Digits(date.getMonth() + 1),
    padTo2Digits(date.getDate()),
  ].join('-');
}
