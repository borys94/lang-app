import express, {Response, Request} from 'express';
import { body } from 'express-validator';

import { requireAdmin, validateRequest } from '../../middlewares';
import database from "../../database";
import snakeToCamel from "../../helpers/snakeToCamel";

const router = express.Router();

router.post(
  '/:grammarId/exercise',
  requireAdmin, 
  [
    body('name').notEmpty().withMessage('Exercise name must be valid'),
    body('value')
      .notEmpty()
      .withMessage('Exercise value must be valid'),
    body('answers')
      .exists()
      .withMessage('Answers is Requiered')
      .isString()
      .withMessage('Answers must be a String')
  ],
  validateRequest,
  async (req: Request, res: Response) => {
    const { name, value, answers } = req.body;

    const exercise = await database.findOne(
      "insert into grammar_exercise (name, value, grammar_id, answers) values ($1, $2, $3, $4) RETURNING *",
      [name, value, req.params.grammarId, answers]
    );
    res.status(201).send(snakeToCamel(exercise));
  }
);

export { router as addGrammarExerciseRouter };
