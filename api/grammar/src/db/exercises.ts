import Database from "../database";

interface ExerciseModel {
  exercise_id: number;
  grammar_id: string;
  name: string;
  created_at: string;
}


interface SubExerciseModel {
  sub_exercise_id: number;
  exercise_id: number;
  value: string;
  answers: string[],
  created_at: string;
}

export default class Exercises {
  static async getByGrammarId(grammarId: string) {
    return (await Database.client.query<ExerciseModel>(
      `SELECT * FROM exercise WHERE grammar_id = $1`,
      [grammarId]
    )).rows;
  }

  static async getById(id: string) {
    return (await Database.client.query<ExerciseModel[]>(
      "SELECT * FROM exercise WHERE exercise_id = $1", 
      [id]
    )).rows;
  }

  static async getSubExercises(id: number) {
    return (await Database.client.query<SubExerciseModel[]>(
      "SELECT * FROM sub_exercise WHERE exercise_id = $1 ORDER BY sub_exercise_id", 
      [id]
    )).rows;
  }

  static async addExercise(grammarId: string, name: string) {
    return (await Database.client.query<ExerciseModel>(
      "INSERT INTO exercise (grammar_id, name) VALUES($1, $2) RETURNING *",
      [grammarId, name]
    )).rows[0];
  }

  static async editSubExercise(subExerciseId: string, value: string, answers: string) {
    return (await Database.client.query<ExerciseModel>(
      "UPDATE sub_exercise SET value = $2, answers = $3 WHERE sub_exercise_id = $1 RETURNING *",
      [subExerciseId, value, answers]
    )).rows[0];
  }

  

  static async addSubExercise(exerciseId: string, value: string, answers: string) {
    console.log(exerciseId, value, answers)
    return (await Database.client.query<ExerciseModel>(
      "INSERT INTO sub_exercise (exercise_id, value, answers) VALUES($1, $2, $3) RETURNING *",
      [exerciseId, value, answers]
    )).rows[0];
  }

  static async editExercise(exerciseId: string, name: string) {
    console.log(exerciseId, name)
    return (await Database.client.query<ExerciseModel>(
      "UPDATE exercise SET name = $2 WHERE exercise_id = $1 RETURNING *",
      [exerciseId, name]
    )).rows[0];
  }
}