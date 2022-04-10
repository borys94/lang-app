import Database from "../database";

interface WordsModel {
  id: number;
  value: string;
  translated: string;
  lesson_id: string;
  type: string;
}[]

export default class Words {
  static async getByLessonId(lessonId: string) {
    return (await Database.client.query<WordsModel>(
      `SELECT * FROM words WHERE lesson_id = $1`,
      [lessonId]
    )).rows;
  }

  static async getById(id: string) {
    return (await Database.client.query<WordsModel>(
      "SELECT * FROM words WHERE word_id = $1", 
      [id]
    )).rows[0];
  }

  static async add(value: string, translated: string, lessonId: string, type: string) {
    return (await Database.client.query<WordsModel>(
      "INSERT INTO words (value, translated, lesson_id, type) VALUES($1, $2, $3, $4) RETURNING *",
      [value, translated, lessonId, type]
    )).rows[0];
  }

  static async remove(id: string) {
    return (await Database.client.query<WordsModel>(
      "DELETE FROM sentences WHERE id = $1", 
      [id]
    )).rows[0];
  }
}