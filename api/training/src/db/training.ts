import Database from "../database";

interface TrainingModel {
  id: number;
  user_id: number;
  lang: string;
  created_at: string;
}[]

export default class Training {
  static async getById(id: string) {
    return (await Database.client.query<TrainingModel>(
      "SELECT * FROM training WHERE id = $1", 
      [id]
    )).rows[0];
  }

  static async getByuserId(userId: string) {
    return (await Database.client.query<TrainingModel>(
      "SELECT * FROM training WHERE user_id = $1", 
      [userId]
    )).rows[0];
  }
}