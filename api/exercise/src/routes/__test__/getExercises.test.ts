import request from "supertest";

import { app } from "../../app";

it("returns an exercise as unuthorized user", async () => {
  const cookie = global.signin();
  await createExercise(cookie);
  const response = await request(app)
    .get("/exercises")
    .expect(200);

  const {exercises} = response.body;
  expect(exercises).toHaveLength(1);
  expect(exercises[0].title).toBe("title");
  expect(exercises[0].lang).toBe("Spanish");
  expect(exercises[0].level).toBe("B1");
  expect(typeof exercises[0].createdAt).toBe("string");
  expect(typeof exercises[0].updatedAt).toBe("string");
});

it("returns an exercise as uthorized user", async () => {
  const cookie = global.signin();
  await createExercise(cookie);

  const response = await request(app)
    .get("/exercises")
    .set("Cookie", global.signin())
    .expect(200);
  
  const {exercises} = response.body;
  expect(exercises).toHaveLength(1);
  expect(exercises[0].title).toBe("title");
  expect(exercises[0].lang).toBe("Spanish");
  expect(exercises[0].level).toBe("B1");
  expect(typeof exercises[0].createdAt).toBe("string");
  expect(typeof exercises[0].updatedAt).toBe("string");
});
