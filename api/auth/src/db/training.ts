import Database from "../database";

interface TrainingModel {
  id: number;
  wordId: number;
  sentenceId: number;
  nextDate: string;
  lastNote: number;
}[]

export default class Sentences {
  static async getById(id: string) {
    return (await Database.client.query<TrainingModel>(
      "SELECT * FROM training WHERE id = $1", 
      [id]
    )).rows[0];
  }
  static async getToday(lang: string = "Spanish") {
    const vocabulary = (await Database.client.query<TrainingModel>(
      `SELECT lang, wordid, sentenceId, training.id, vocabulary.value, vocabulary.translated  FROM training 
        LEFT JOIN vocabulary ON training.wordid = vocabulary.id
        LEFT JOIN lessons ON lessons.id = vocabulary.lessonId
        WHERE training.nextDate <= NOW() AND lessons.lang = $1`,
      [lang]
    )).rows;
    const sentences = (await Database.client.query<TrainingModel>(
      `SELECT lang, wordid, sentenceId, training.id, sentences.value, sentences.translated  FROM training 
        LEFT JOIN sentences ON training.sentenceid = sentences.id
        LEFT JOIN lessons ON lessons.id = sentences.lessonId
        WHERE training.nextDate <= NOW() AND lessons.lang = $1`,
      [lang]
    )).rows;
    return [...vocabulary, ...sentences]
  }

  static async update(id: string, nextDate: string, lastNote: number) {
    return (await Database.client.query<TrainingModel>(
      "UPDATE training SET nextDate = $2, lastNote = $3 WHERE id = $1", 
      [id, nextDate, lastNote]
    )).rows[0];
  }

  static async addWord(wordId: string, nextDate: string): Promise<TrainingModel> {
    return (await Database.client.query<TrainingModel>(
      "INSERT INTO training (wordId, nextDate) VALUES($1, $2) RETURNING *",
      [wordId, nextDate]
    )).rows[0];
  }

  static async addSentence(sentenceId: string, nextDate: string): Promise<TrainingModel> {
    return (await Database.client.query<TrainingModel>(
      "INSERT INTO training (sentenceId, nextDate) VALUES($1, $2) RETURNING *",
      [sentenceId, nextDate]
    )).rows[0];
  }

}