import Database from "../database";

interface ExampleModel {
  example_id: number;
  value: string;
  translated: string;
  grammar_id: string;
  created_at: string;
}

export default class Examples {
  static async getByGrammarId(grammarId: string) {
    return (await Database.client.query<ExampleModel[]>(
      `SELECT * FROM examples WHERE grammar_id = $1`,
      [grammarId]
    )).rows;
  }

  static async getById(id: string) {
    return (await Database.client.query<ExampleModel>(
      "SELECT * FROM examples WHERE example_id = $1", 
      [id]
    )).rows[0];
  }

  static async add(value: string, translated: string, grammarId: string) {
    return (await Database.client.query<ExampleModel>(
      "INSERT INTO examples (value, translated, grammar_id) VALUES($1, $2, $3) RETURNING *",
      [value, translated, grammarId]
    )).rows[0];
  }

  static async remove(id: string) {
    return (await Database.client.query<ExampleModel>(
      "DELETE FROM examples WHERE id = $1", 
      [id]
    )).rows[0];
  }
}