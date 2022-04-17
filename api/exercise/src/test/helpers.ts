import request from "supertest";
import mongoose from "mongoose";
import jwt from "jsonwebtoken";

import { app } from "../app";
import {ExerciseDoc} from "../db/exercise"

declare global {
  function signin(): string[];
  function createExercise(cookie: string[]): Promise<ExerciseDoc>;
}

global.signin = () => {
  const payload = {
    id: new mongoose.Types.ObjectId().toHexString(),
    email: "test@test.com",
  };

  const token = jwt.sign(payload, process.env.JWT_KEY!);
  const session = { jwt: token };
  const sessionJSON = JSON.stringify(session);
  const base64 = Buffer.from(sessionJSON).toString("base64");

  return [`express:sess=${base64}`];
};

global.createExercise = async (cookie: string[]): Promise<ExerciseDoc> => {
  return (await request(app)
    .post("/exercises")
    .set("Cookie", cookie)
    .send({
      title: "title",
      lang: "Spanish",
      level: "B1"
    })).body.exercise;
}
