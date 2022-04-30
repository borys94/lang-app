import request from 'supertest';
import { app } from '../../../app';

it('fails when an user is not authorized', async () => {
  await request(app)
    .post('/api/words/categories')
    .send({
      name: 'test name',
      lang: 'Spanish',
      level: 'A1',
    })
    .expect(401);
});

it('fails when an incorrect name is supplied', async () => {
  const cookie = await global.signin();
  await request(app)
    .post('/api/words/categories')
    .set("Cookie", cookie)
    .send({
      name: '',
      lang: 'Spanish',
      level: 'A1',
    })
    .expect(400);
});

it('fails when an incorrect lang is supplied', async () => {
  const cookie = await global.signin();
  await request(app)
    .post('/api/words/categories')
    .set("Cookie", cookie)
    .send({
      name: 'name',
      lang: 'Not_existed',
      level: 'A1',
    })
    .expect(400);
});

it('fails when an incorrect level is supplied', async () => {
  const cookie = await global.signin();
  await request(app)
    .post('/api/words/categories')
    .set("Cookie", cookie)
    .send({
      name: 'name',
      lang: 'Spanish',
      level: 'AAA',
    })
    .expect(400);
});

it('success when an correct data is supplied', async () => {
  const cookie = await global.signin();
  const response = await request(app)
    .post('/api/words/categories')
    .set("Cookie", cookie)
    .send({
      name: 'name',
      lang: 'Spanish',
      level: 'A1',
    })
    .expect(201);
  expect(response.body).toMatchObject({
    name: "name",
    lang: 'Spanish',
    level: 'A1',
  });
  expect(typeof response.body.wordCategoryId).toBe("number")
});