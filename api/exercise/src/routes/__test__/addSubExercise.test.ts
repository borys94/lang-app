import request from "supertest";
import mongoose from "mongoose";

import { app } from "../../app";

it("fails when trying to save exercise as an unauthorized user", async () => {
  const id = new mongoose.Types.ObjectId().toHexString();
  await request(app)
    .post(`/exercises/${id}`)
    .send({
      text: "text", 
      title: "title", 
      answers: "{\"anwser\"}",
    })
    .expect(401);
});

it("returns an error if an invalid exercise id is provided", async () => {
  const id = new mongoose.Types.ObjectId().toHexString();
  const cookie = global.signin();
  const response = await request(app)
    .post(`/exercises/${id}`)
    .set("Cookie", cookie)
    .send({
      title: "title",
      text: "text",
      answers: "answers"
    })
    .expect(400);
  expect(response.body.errors).toEqual([
    {
      message: "Exercise does not exist"
    }
  ]);
});

it("returns an error if an invalid title is provided", async () => {
  const cookie = global.signin();
  const exercise = await createExercise(cookie);
  const response = await request(app)
    .post(`/exercises/${exercise.id}`)
    .set("Cookie", cookie)
    .send({
      title: "",
      text: "text",
      answers: "answers"
    })
    .expect(400);
  expect(response.body.errors).toEqual([{
    message: "Title is required",
    field: "title"
  }]);
});

it("returns an error if an invalid text is provided", async () => {
  const cookie = global.signin();
  const exercise = await createExercise(cookie);
  const response = await request(app)
    .post(`/exercises/${exercise.id}`)
    .set("Cookie", cookie)
    .send({
      title: "title",
      text: "",
      answers: "answers"
    })
    .expect(400);
  expect(response.body.errors).toBeDefined();
});

it("returns an error if an invalid answers is provided", async () => {
  const cookie = global.signin();
  const exercise = await createExercise(cookie);
  const response = await request(app)
    .post(`/exercises/${exercise.id}`)
    .set("Cookie", cookie)
    .send({
      title: "title",
      text: "text",
      answers: ""
    })
    .expect(400);
  expect(response.body.errors).toBeDefined();
});

it("creates a sub exercise with valid inputs", async () => {
  const cookie = global.signin();
  const exercise = await createExercise(cookie);
  const title = "title";
  const text = "text";
  const answers = "answers"
  
  const response = await request(app)
    .post(`/exercises/${exercise.id}`)
    .set("Cookie", cookie)
    .send({
      title,
      text,
      answers
    })
    .expect(201);

  const { subExercise } = response.body
  expect(Object.keys(subExercise)).toHaveLength(7);
  expect(subExercise.title).toBe(title);
  expect(subExercise.text).toBe(text);
  expect(subExercise.answers).toBe(answers);
  expect(subExercise.exerciseId).toBe(exercise.id);
  expect(typeof subExercise.id).toBe("string");
  expect(typeof subExercise.createdAt).toBe("string");
  expect(typeof subExercise.updatedAt).toBe("string");
});