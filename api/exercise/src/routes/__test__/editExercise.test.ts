import request from "supertest";
import mongoose from "mongoose";

import { app } from "../../app";

it("fails when trying to update exercise as unauthorized user", async () => {
  const id = new mongoose.Types.ObjectId().toHexString();
  await request(app)
    .put(`/exercises/${id}`)
    .send({
      title: "title",
      lang: "lang",
      level: "level"
    })
    .expect(401);
});

it("returns an error if an invalid title is provided", async () => {
  const cookie = global.signin();
  const exercise = await createExercise(cookie);
  const title = "title";
  const lang = "lang";
  const level = "B1";

  const response = await request(app)
    .put(`/exercises/${exercise.id}`)
    .set("Cookie", global.signin())
    .send({
      title,
      lang,
      level
    })
    .expect(400);
  
  expect(response.body.errors).toBeDefined();
});

it("returns an error if an invalid lang is provided", async () => {
  const cookie = global.signin();
  const exercise = await createExercise(cookie);

  const title = "title";
  const lang = "Invalid";
  const level = "B1"
  const response = await request(app)
  .put(`/exercises/${exercise.id}`)
    .set("Cookie", global.signin())
    .send({
      title,
      lang,
      level
    })
    .expect(400);
  
  expect(response.body.errors).toBeDefined();
});

it("returns an error if an invalid level is provided", async () => {
  const cookie = global.signin();
  const exercise = await createExercise(cookie);
  const title = "title";
  const lang = "Spanish";
  const level = "invalid_level";

  const response = await request(app)
  .put(`/exercises/${exercise.id}`)
    .set("Cookie", global.signin())
    .send({
      title,
      lang,
      level
    })
    .expect(400);
  
  expect(response.body.errors).toBeDefined();
});

it("updates an exercise with valid inputs", async () => {
  const cookie = global.signin();
  const exercise = await createExercise(cookie);
  const title = "new title";
  const lang = "German";
  const level = "C2"

  const response = await request(app)
  .put(`/exercises/${exercise.id}`)
    .set("Cookie", global.signin())
    .send({
      title,
      lang,
      level
    })
    .expect(200);

  expect(Object.keys(response.body.exercise)).toHaveLength(6);
  expect(response.body.exercise.title).toBe(title);
  expect(response.body.exercise.lang).toBe(lang);
  expect(response.body.exercise.level).toBe(level);
  expect(typeof response.body.exercise.createdAt).toBe("string");
  expect(typeof response.body.exercise.updatedAt).toBe("string");
});