import Database from "../database";

interface WordsModel {
  id: number;
  user_id: number;
  lang: string;
  lesson_id: number;
  created_at: string;
  external_id: number;
  type: string;
}[]

export default class Words {
  static async getByTrainingId(id: string) {
    return (await Database.client.query<WordsModel>(
      "SELECT * FROM words WHERE training_id = $1", 
      [id]
    )).rows[0];
  }

  static async add(
    value: string, 
    translated: string, 
    lessonId: number, 
    trainingId: number,
    externalId: number,
    type: string,
  ) {
    return (await Database.client.query<WordsModel>(
      "INSERT INTO words (value, translated, lesson_id, training_id, next_date, external_id, type) VALUES ($1, $2, $3, $4, CURRENT_DATE + INTERVAL '1 DAY', $5, $6) RETURNING *", 
      [value, translated, lessonId, trainingId, externalId, type]
    )).rows[0];
  }

  static async getByValue(value: string) {
    return (await Database.client.query<WordsModel>(
      "SELECT * FROM words WHERE value = $1", 
      [value]
    )).rows[0];
  }

  static async getWord(trainingId: number, externalId: number, type: string) {
    return (await Database.client.query<WordsModel>(
      "SELECT * FROM words WHERE training_id = $1 AND external_id = $2 AND type = $3", 
      [trainingId, externalId, type]
    )).rows[0];
  }

  static async getWordsInLessons(trainingId: number, isGrammar: boolean = false) {
    return (await Database.client.query<WordsModel>(
      `SELECT 
        lesson_id,
        COUNT(*)
      FROM words 
      WHERE 
        training_id = $1
        ${isGrammar && "AND type = 'grammar'" || "AND type != 'grammar'"}
      GROUP BY lesson_id
      `, 
      [trainingId]
    )).rows;
  }

  static async getWordsInLesson(trainingId: number, lessonId: number, isGrammar: boolean) {
    return (await Database.client.query<WordsModel>(
      `SELECT * FROM words WHERE training_id = $1 AND lesson_id = $2 ${isGrammar && "AND type = 'grammar'" || "AND type != 'grammar'"}`, 
      [trainingId, lessonId]
    )).rows;
  }

  static async updateNextDate(wordId: number, nextDate: string) {
    return (await Database.client.query<WordsModel>(
      `UPDATE words SET next_date = $2 WHERE word_id = $1`, 
      [wordId, nextDate]
    )).rows;
  }
}
