import request from "supertest";
import { app } from "../../app";

it("fails when trying to delete word as unauthorized user", async () => {
  await request(app).delete("/api/vocabulary/123").expect(401);
});

it("fails when trying to delete an unexisting word", async () => {
  const cookie = await global.signin();
  await request(app)
    .delete("/api/vocabulary/123")
    .set("Cookie", cookie)
    .expect(400);
});

it("passes when trying to delete a word", async () => {
  const cookie = await global.signin();
  const postResponse = await request(app)
    .post("/api/vocabulary/words")
    .set("Cookie", cookie)
    .send({
      value: "Hola",
      translated: "Hello",
    });

  const response = await request(app)
    .delete(`/api/vocabulary/${postResponse.body.word.id}`)
    .set("Cookie", cookie)
    .expect(200);
  expect(response.body).toEqual({});
});
