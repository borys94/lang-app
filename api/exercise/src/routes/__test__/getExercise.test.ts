import request from "supertest";
import mongoose from "mongoose";

import { app } from "../../app";

it("returns an error if invalid exercise id is provided", async () => {
  const id = new mongoose.Types.ObjectId().toHexString();
  const response = await request(app)
    .get(`/exercises/${id}`)
    .expect(400);

  expect(response.body.errors).toEqual([{
    message: "Exercise does not exist"
  }]);
});

it("returns an exercise as unuthorized user", async () => {
  const cookie = global.signin();
  const exercise = await createExercise(cookie);
  const response = await request(app)
    .get(`/exercises/${exercise.id}`)
    .expect(200);

  expect(Object.keys(response.body.exercise)).toHaveLength(6);
  expect(response.body.exercise.title).toBe("title");
  expect(response.body.exercise.lang).toBe("Spanish");
  expect(response.body.exercise.level).toBe("B1");
  expect(typeof response.body.exercise.createdAt).toBe("string");
  expect(typeof response.body.exercise.updatedAt).toBe("string");
});

it("returns an exercise as uthorized user", async () => {
  const cookie = global.signin();
  const exercise = await createExercise(cookie);

  const response = await request(app)
    .get(`/exercises/${exercise.id}`)
    .set("Cookie", global.signin())
    .expect(200);
  
  expect(Object.keys(response.body.exercise)).toHaveLength(6);
  expect(response.body.exercise.title).toBe("title");
  expect(response.body.exercise.lang).toBe("Spanish");
  expect(response.body.exercise.level).toBe("B1");
  expect(typeof response.body.exercise.createdAt).toBe("string");
  expect(typeof response.body.exercise.updatedAt).toBe("string");
});
