import request from 'supertest';
import { app } from '../../../app';

it('fails when an user is not authorized', async () => {
  await request(app)
    .post('/api/grammar')
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
    .post('/api/grammar')
    .set("Cookie", cookie)
    .send({
      name: "name",
      lang: "Spanish",
      level: "A1",
      value: "value",
    })
    .expect(401);
});

it('fails when an incorrect name is supplied', async () => {
  const cookie = await global.signin("admin");
  const response = await request(app)
    .post('/api/grammar')
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
  const response = await request(app)
    .post('/api/grammar')
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

  const response = await request(app)
    .post('/api/grammar')
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

  const response = await request(app)
    .post('/api/grammar')
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
  const requestBody = {
    name: "name",
    lang: "Spanish",
    level: "A1",
    value: "value",
  }

  const response = await request(app)
    .post('/api/grammar')
    .set("Cookie", cookie)
    .send(requestBody)
    .expect(201);

  expect(response.body).toMatchObject(requestBody);
  expect(typeof response.body.grammarId).toBe("number")
  expect(typeof response.body.createdAt).toBe("string")
});