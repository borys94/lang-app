import Database from "../database";

interface LessonsModel {
  id: number;
  name: string;
  level: string;
  lang: string;
  created_at: string;
}[]

export default class Lessons {
  static async getById(id: string): Promise<LessonsModel> {
    return (await Database.client.query<LessonsModel>(
      `SELECT * FROM lessons WHERE lesson_id = $1`,
      [id]
    )).rows[0];
  }

  static async getByLang(lang: string) {
    return (await Database.client.query<LessonsModel>(
      `SELECT *, (SELECT COUNT(*) FROM words WHERE words.lesson_id = lessons.lesson_id) as words_count FROM lessons WHERE lang = $1`,
      [lang]
    )).rows;
  }

  static async add(name: string, lang: string, level: string): Promise<LessonsModel> {
    return (await Database.client.query<LessonsModel>(
      "INSERT INTO lessons (name, lang, level) VALUES($1, $2, $3) RETURNING *",
      [name, lang, level]
    )).rows[0];
  }
}