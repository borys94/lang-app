import Database from "../database";

interface NoteModel {
  word_id: number;
  note: number;
  created_at: string
}

export default class Notes {
  static async getByWordId(id: string) {
    return (await Database.client.query<NoteModel[]>(
      "SELECT * FROM notes WHERE word_id = $1 ORDER BY created_at DESC LIMIT 6", 
      [id]
    )).rows;
  }

  static async add(wordId: number, note: number) {
    return (await Database.client.query<NoteModel>(
      "INSERT INTO notes (word_id, note) VALUES ($1, $2) RETURNING *", 
      [wordId, note]
    )).rows[0];
  }

}
