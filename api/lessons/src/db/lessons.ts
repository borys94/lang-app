import Database from "../database";

interface LessonsModel {
  id: number;
  name: string;
  lang: string;
}[]

export default class Lessons {
  static async getAll(lang: string = "Spanish"): Promise<LessonsModel[]> {
    return (await Database.client.query<LessonsModel>(
      `SELECT *, (
        SELECT COUNT(*) FROM training
          LEFT JOIN vocabulary ON training.wordid = vocabulary.id
	        LEFT JOIN sentences ON training.sentenceid = sentences.id
          WHERE sentences.lessonid = lessons.id OR vocabulary.lessonid = lessons.id
        ) As added,
        (
          SELECT COUNT(*) FROM vocabulary
            WHERE vocabulary.lessonid = lessons.id
        ) As allWords,
        (
          SELECT COUNT(*) FROM sentences
            WHERE sentences.lessonid = lessons.id
        ) As allSentences
        FROM lessons WHERE lang = $1`,
      [lang]
    )).rows;
  }

  static async getById(id: string): Promise<LessonsModel> {
    return (await Database.client.query<LessonsModel>(
      `SELECT * FROM lessons WHERE id = $1`,
      [id]
    )).rows[0];
  }

  static async add(name: string, lang: string, level: string): Promise<LessonsModel> {
    return (await Database.client.query<LessonsModel>(
      "INSERT INTO lessons (name, lang, level) VALUES($1, $2, $3) RETURNING *",
      [name, lang, level]
    )).rows[0];
  }
}