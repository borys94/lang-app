import Database from "../database";

interface VocabularyModel {
  id: number;
  name: string;
  lang: string;
}[]

export default class Vocabulary {
  static async getByLessonId(lessonId: string, lang: string = "Spanish") {
    return (await Database.client.query<VocabularyModel>(
      `SELECT vocabulary.id, value, translated, nextdate, lessons.id as lessonId 
        FROM vocabulary 
        LEFT JOIN training ON vocabulary.id = training.wordid 
        INNER JOIN lessons ON lessons.id = vocabulary.lessonid 
        WHERE lessons.lang = $2 AND lessons.id = $1
      `,
      [lessonId, lang]
    )).rows;
  }

  static async getById(id: string, lang: string = "Spanish") {
    return (await Database.client.query<VocabularyModel>(
      `SELECT vocabulary.id, value, translated, nextdate, lessons.id as lessonId 
        FROM vocabulary 
        LEFT JOIN training ON vocabulary.id = training.wordid 
        INNER JOIN lessons ON lessons.id = vocabulary.lessonid 
        WHERE lessons.lang = $2 AND lessons.id = $1
      `,
      [id, lang]
    )).rows[0];
  }

  static async add(value: string, translated: string, lessonId: string): Promise<VocabularyModel> {
    return (await Database.client.query<VocabularyModel>(
      "INSERT INTO vocabulary (value, translated, lessonId) VALUES($1, $2, $3) RETURNING *",
      [value, translated, lessonId]
    )).rows[0];
  }

  static async remove(id: string) {
    return (await Database.client.query<VocabularyModel>(
      "DELETE FROM vocabulary WHERE id = $1", 
      [id]
    )).rows[0];
  }
}