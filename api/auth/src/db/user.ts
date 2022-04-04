import Database from "../database";
import {Password} from "../services/password";

interface UserModel {
  id: number;
  email: string;
  password: string;
}

export default class User {
  static async addUser(email: string, password: string) {
    const hashed = await Password.toHash(password);
    return (await Database.client.query<UserModel>(
      "INSERT INTO users (email, password) VALUES ($1, $2) RETURNING *", 
      [email, hashed]
    )).rows[0];
  }

  static async getUser(id: number) {
    return (await Database.client.query<UserModel>(
      "SELECT * FROM users WHERE id = $1", 
      [id]
    )).rows[0];
  }

  static async getByEmail(email: string) {
    return (await Database.client.query<UserModel>(
      "SELECT * FROM users WHERE email = $1", 
      [email]
    )).rows[0];
  }

  
}