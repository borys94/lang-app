import request from "supertest";
import { app } from "../../app";

it("fails when trying to create a word as unauthorized user", async () => {
  await request(app)
    .post("/api/vocabulary/words")
    .send({
      value: "Hola",
      translated: "Hello",
    })
    .expect(401);
});

it("fails when incorrect translated value is suplied", async () => {
  const cookie = await global.signin();
  await request(app)
    .post("/api/vocabulary/words")
    .set("Cookie", cookie)
    .send({
      value: "Hola",
      translated: "",
    })
    .expect(400);
});

it("fails when incorrect value is suplied", async () => {
  const cookie = await global.signin();
  await request(app)
    .post("/api/vocabulary/words")
    .set("Cookie", cookie)
    .send({
      value: "",
      translated: "translated",
    })
    .expect(400);
});

it("passes when correct data is supplied", async () => {
  const cookie = await global.signin();
  const response = await request(app)
    .post("/api/vocabulary/words")
    .set("Cookie", cookie)
    .send({
      value: "Hola",
      translated: "Hello",
    })
    .expect(201);

  expect(response.body.word.value).toBe("Hola");
  expect(response.body.word.translated).toBe("Hello");
  expect(response.body.word.id).toBeDefined();
  expect(Object.keys(response.body).length).toBe(1);
  expect(Object.keys(response.body.word).length).toBe(3);
});
