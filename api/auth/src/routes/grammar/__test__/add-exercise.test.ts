import request from 'supertest';
import { app } from '../../../app';

it('fails when an user is not authorized', async () => {
  await request(app)
    .post('/api/grammar/1/exercise')
    .send({
      name: "name",
      value: "value",
      answers: "",
    })
    .expect(401);
});

it('fails when an user has no right', async () => {
  const cookie = await global.signin();
  await request(app)
    .post('/api/grammar/1/exercise')
    .set("Cookie", cookie)
    .send({
      name: "name",
      value: "value",
      answers: "",
    })
    .expect(401);
});

it('fails when an incorrect name is supplied', async () => {
  const cookie = await global.signin("admin");
  const grammar = await global.addGrammar(cookie, "name", "Spanish", "A1", "value");

  const response = await request(app)
    .post(`/api/grammar/${grammar.grammarId}/exercise`)
    .set("Cookie", cookie)
    .send({
      name: "",
      value: "value",
      answers: "",
    })
    .expect(400);
  expect(response.body.errors).toHaveLength(1);
  expect(response.body.errors[0].field).toBe("name");
});

it('fails when an incorrect value is supplied', async () => {
  const cookie = await global.signin("admin");
  const grammar = await global.addGrammar(cookie, "name", "Spanish", "A1", "value");

  const response = await request(app)
    .post(`/api/grammar/${grammar.grammarId}/exercise`)
    .set("Cookie", cookie)
    .send({
      name: "name",
      value: "",
      answers: "",
    })
    .expect(400);
  expect(response.body.errors).toHaveLength(1);
  expect(response.body.errors[0].field).toBe("value");
});

it('success when an correct data is supplied', async () => {
  const cookie = await global.signin("admin");
  const requestBody = {
    name: "name",
    value: "value",
    answers: "answers, 2 answer",
  }
  const grammar = await global.addGrammar(cookie, "name", "Spanish", "A1", "value");

  const response = await request(app)
    .post(`/api/grammar/${grammar.grammarId}/exercise`)
    .set("Cookie", cookie)
    .send(requestBody)
    .expect(201);

  expect(response.body).toMatchObject(requestBody);
  expect(typeof response.body.grammarExerciseId).toBe("number")
  expect(typeof response.body.createdAt).toBe("string")
});