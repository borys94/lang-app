import Database from "../database";

interface SentencesModel {
  id: number;
  name: string;
  lang: string;
}[]

export default class Sentences {
  // static async getByLessonId(lessonId: string) {
  //   return (await Database.client.query<SentencesModel>(
  //     "SELECT * FROM sentences WHERE lessonId = $1", 
  //     [lessonId]
  //   )).rows;
  // }

  static async getByLessonId(lessonId: string, lang: string = "Spanish") {
    return (await Database.client.query<SentencesModel>(
      `SELECT sentences.id, value, translated, nextdate, lessons.id as lessonId 
        FROM sentences 
        LEFT JOIN training ON sentences.id = training.sentenceId 
        INNER JOIN lessons ON lessons.id = sentences.lessonid 
        WHERE lessons.lang = $2 AND lessons.id = $1
      `,
      [lessonId, lang]
    )).rows;
  }

  static async getById(id: string) {
    return (await Database.client.query<SentencesModel>(
      "SELECT * FROM sentences WHERE id = $1", 
      [id]
    )).rows[0];
  }

  static async add(value: string, translated: string, lessonId: string): Promise<SentencesModel> {
    return (await Database.client.query<SentencesModel>(
      "INSERT INTO sentences (value, translated, lessonId) VALUES($1, $2, $3) RETURNING *",
      [value, translated, lessonId]
    )).rows[0];
  }

  static async remove(id: string) {
    return (await Database.client.query<SentencesModel>(
      "DELETE FROM sentences WHERE id = $1", 
      [id]
    )).rows[0];
  }
}