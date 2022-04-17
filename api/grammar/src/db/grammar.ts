import Database from "../database";

interface LessonsModel {
  id: number;
  name: string;
  level: string;
  lang: string;
  created_at: string;
}[]

export default class Grammar {
  static async getById(id: string): Promise<LessonsModel> {
    return (await Database.client.query<LessonsModel>(
      `SELECT * FROM grammar WHERE grammar_id = $1`,
      [id]
    )).rows[0];
  }

  static async getByLang(lang: string) {
    return (await Database.client.query<LessonsModel>(
      `SELECT * FROM grammar WHERE lang = $1 ORDER BY name`,
      [lang]
    )).rows;
  }

  static async add(name: string, lang: string, level: string, value: string): Promise<LessonsModel> {
    return (await Database.client.query<LessonsModel>(
      "INSERT INTO grammar (name, lang, level, value) VALUES($1, $2, $3, $4) RETURNING *",
      [name, lang, level, value]
    )).rows[0];
  }

  static async edit(grammarId: number, name: string, lang: string, level: string, value: string): Promise<LessonsModel> {
    return (await Database.client.query<LessonsModel>(
      "UPDATE grammar SET name = $2, lang = $3, level = $4, value = $5 WHERE grammar_id = $1 RETURNING *",
      [grammarId, name, lang, level, value]
    )).rows[0];
  }
}