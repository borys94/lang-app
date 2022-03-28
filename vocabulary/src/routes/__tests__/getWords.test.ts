import request from "supertest";
import { app } from "../../app";

it("fails when trying to get words as unauthorized user", async () => {
  await request(app).get("/api/vocabulary").expect(401);
});

it("passes when trying to get words (empty) as logged user", async () => {
  const cookie = await global.signin();
  const response = await request(app)
    .get("/api/vocabulary")
    .set("Cookie", cookie)
    .expect(200);
  expect(response.body).toEqual({ words: [] });
});

it("passes when trying to get words as logged user", async () => {
  const cookie = await global.signin();

  await request(app).post("/api/vocabulary/words").set("Cookie", cookie).send({
    value: "Hola",
    translated: "Hello",
  });

  const response = await request(app)
    .get("/api/vocabulary")
    .set("Cookie", cookie)
    .expect(200);
  expect(response.body.words.length).toBe(1);
  expect(response.body.words[0].value).toBe("Hola");
  expect(response.body.words[0].translated).toBe("Hello");
});
