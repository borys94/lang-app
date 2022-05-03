import request, { Response } from 'supertest';
import { app } from '../../../app';

it('fails when an user is not authorized', async () => {
  await request(app)
    .put('/api/grammar/1')
    .send({
      name: "name",
      lang: "Spanish",
      level: "A1",
      value: "value",
    })
    .expect(401);
});

it('fails when an user has no right', async () => {
  const cookie = await global.signin();
  await request(app)
    .put('/api/grammar/1')
    .set("Cookie", cookie)
    .send({
      name: "name",
      lang: "Spanish",
      level: "A1",
      value: "value",
    })
    .expect(401);
});

it('fails when a grammar does not exist', async () => {
  const cookie = await global.signin("admin");
  await request(app)
    .put('/api/grammar/999999999')
    .set("Cookie", cookie)
    .send({
      name: "name",
      lang: "Spanish",
      level: "A1",
      value: "value",
    })
    .expect(404);
});

it('fails when an incorrect name is supplied', async () => {
  const cookie = await global.signin("admin");
  const grammar = await global.addGrammar(cookie, "name", "Spanish", "A1", "value");
  const response = await request(app)
    .put(`/api/grammar/${grammar.grammarId}`)
    .set("Cookie", cookie)
    .send({
      name: "",
      lang: "Spanish",
      level: "A1",
      value: "value",
    })
    .expect(400);
  expect(response.body.errors).toHaveLength(1);
  expect(response.body.errors[0].field).toBe("name");
});

it('fails when an incorrect lang is supplied', async () => {
  const cookie = await global.signin("admin");
  const grammar = await global.addGrammar(cookie, "name", "Spanish", "A1", "value");

  const response = await request(app)
    .put(`/api/grammar/${grammar.grammarId}`)
    .set("Cookie", cookie)
    .send({
      name: "name",
      lang: "NotExistedLand",
      level: "A1",
      value: "value",
    })
    .expect(400);
  expect(response.body.errors).toHaveLength(1);
  expect(response.body.errors[0].field).toBe("lang");
});

it('fails when an incorrect level is supplied', async () => {
  const cookie = await global.signin("admin");
  const grammar = await global.addGrammar(cookie, "name", "Spanish", "A1", "value");

  const response = await request(app)
    .put(`/api/grammar/${grammar.grammarId}`)
    .set("Cookie", cookie)
    .send({
      name: "name",
      lang: "Spanish",
      level: "NotExisted",
      value: "value",
    })
    .expect(400);

  expect(response.body.errors).toHaveLength(1);
  expect(response.body.errors[0].field).toBe("level");
});

it('fails when an incorrect value is supplied', async () => {
  const cookie = await global.signin("admin");
  const grammar = await global.addGrammar(cookie, "name", "Spanish", "A1", "value");

  const response = await request(app)
    .put(`/api/grammar/${grammar.grammarId}`)
    .set("Cookie", cookie)
    .send({
      name: "name",
      lang: "Spanish",
      level: "A1",
      value: "",
    })
    .expect(400);

  expect(response.body.errors).toHaveLength(1);
  expect(response.body.errors[0].field).toBe("value");
});

it('success when an correct data is supplied', async () => {
  const cookie = await global.signin("admin");
  const grammar = await global.addGrammar(cookie, "name", "Spanish", "A1", "value");
  const requestBody = {
    name: "new name",
    lang: "English",
    level: "B1",
    value: "new value",
  }

  const response = await request(app)
    .put(`/api/grammar/${grammar.grammarId}`)
    .set("Cookie", cookie)
    .send(requestBody)
    .expect(200);

  expect(response.body).toMatchObject(requestBody);
  expect(response.body.grammarId).toBe(grammar.grammarId)
  expect(typeof response.body.createdAt).toBe("string")
});