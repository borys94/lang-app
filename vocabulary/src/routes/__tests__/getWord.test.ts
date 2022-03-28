import request from "supertest";
import { app } from "../../app";

it("fails when trying to get a word as unauthorized user", async () => {
  await request(app).get("/api/vocabulary/123").expect(401);
});

it("fails when trying to get unexisting word", async () => {
  const cookie = await global.signin();
  await request(app)
    .get("/api/vocabulary/123")
    .set("Cookie", cookie)
    .expect(400);
});

it("passes when trying to get a word as logged user", async () => {
  const cookie = await global.signin();
  const postResponse = await request(app)
    .post("/api/vocabulary/words")
    .set("Cookie", cookie)
    .send({
      value: "Hola",
      translated: "Hello",
    });

  const response = await request(app)
    .get(`/api/vocabulary/${postResponse.body.word.id}`)
    .set("Cookie", cookie)
    .expect(200);

  expect(response.body.word.value).toBe("Hola");
  expect(response.body.word.translated).toBe("Hello");
  expect(response.body.word.id).toBeDefined();
  expect(Object.keys(response.body).length).toBe(1);
  expect(Object.keys(response.body.word).length).toBe(3);
});
