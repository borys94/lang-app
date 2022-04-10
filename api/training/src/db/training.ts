import Database from "../database";

interface TrainingModel {
  training_id: number;
  user_id: number;
  lang: string;
  created_at: string;
}[]

export default class Training {
  static async getById(id: string) {
    return (await Database.client.query<TrainingModel>(
      "SELECT * FROM trainings WHERE training_id = $1", 
      [id]
    )).rows[0];
  }

  static async getByUserId(userId: number) {
    return (await Database.client.query<TrainingModel>(
      "SELECT * FROM trainings WHERE user_id = $1", 
      [userId]
    )).rows[0];
  }

  static async add(userId: string | number, lang: string) {
    return (await Database.client.query<TrainingModel>(
      "INSERT INTO trainings (user_id, lang) VALUES ($1, $2) RETURNING *", 
      [userId, lang]
    )).rows[0];
  }

  static async getToday(userId: number) {
    return (await Database.client.query<TrainingModel>(
      "SELECT * FROM trainings JOIN words USING(training_id) WHERE user_id = $1 AND next_date <= CURRENT_DATE",
      [userId]
    )).rows;
  }
}