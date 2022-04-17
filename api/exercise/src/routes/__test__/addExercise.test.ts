import request from "supertest";
import { app } from "../../app";

it("fails when trying to save exercise as unauthorized user", async () => {
  await request(app)
    .post("/exercises")
    .send({
      title: "test@test.com",
      lang: "password",
      level: ""
    })
    .expect(401);
});

it("returns an error if an invalid title is provided", async () => {
  const title = "";
  const lang = "lang";
  const level = "B1"
  const response = await request(app)
    .post("/exercises")
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
  const title = "title";
  const lang = "Invalid";
  const level = "B1"
  const response = await request(app)
    .post("/exercises")
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
  const title = "title";
  const lang = "Spanish";
  const level = "invalid_level"
  const response = await request(app)
    .post("/exercises")
    .set("Cookie", global.signin())
    .send({
      title,
      lang,
      level
    })
    .expect(400);
  
  expect(response.body.errors).toBeDefined();
});

it("creates an exercise with valid inputs", async () => {
  const title = "title";
  const lang = "Spanish";
  const level = "B1"
  const response = await request(app)
    .post("/exercises")
    .set("Cookie", global.signin())
    .send({
      title,
      lang,
      level
    })
    .expect(201);

  expect(Object.keys(response.body.exercise)).toHaveLength(6);
  expect(response.body.exercise.title).toBe(title);
  expect(response.body.exercise.lang).toBe(lang);
  expect(response.body.exercise.level).toBe(level);
  expect(typeof response.body.exercise.createdAt).toBe("string");
  expect(typeof response.body.exercise.updatedAt).toBe("string");
});