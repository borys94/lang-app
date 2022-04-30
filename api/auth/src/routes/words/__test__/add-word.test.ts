import request, { Response } from 'supertest';
import { app } from '../../../app';

it('fails when an user is not authorized', async () => {
  await request(app)
    .post('/api/words')
    .send({
      value: 'test name',
      translated: 'Spanish',
      wordCategoryId: 1,
    })
    .expect(401);
});

it('fails when an incorrect value is supplied', async () => {
  const cookie = await global.signin();
  await request(app)
    .post('/api/words')
    .set("Cookie", cookie)
    .send({
      value: '',
      translated: 'Spanish',
      wordCategoryId: 1,
    })
    .expect(400);
});

it('fails when an incorrect lang is supplied', async () => {
  const cookie = await global.signin();
  await request(app)
    .post('/api/words')
    .set("Cookie", cookie)
    .send({
      value: 'value',
      lang: 'Not_existed',
      wordCategoryId: 1,
    })
    .expect(400);
});

it('fails when an incorrect wordCategoryId is supplied', async () => {
  const cookie = await global.signin();
  await request(app)
    .post('/api/words')
    .set("Cookie", cookie)
    .send({
      value: 'value',
      lang: 'Spanish',
      wordCategoryId: 999999999,
    })
    .expect(400);
});

it('success when an correct data is supplied', async () => {
  const cookie = await global.signin();
  const wordCategory = await request(app)
    .post('/api/words/categories')
    .set("Cookie", cookie)
    .send({
      name: 'name',
      lang: 'Spanish',
      level: 'A1',
    })
    .expect(201);

  const response = await request(app)
    .post('/api/words')
    .set("Cookie", cookie)
    .send({
      value: 'value',
      translated: 'translated',
      wordCategoryId: wordCategory.body.wordCategoryId,
    })
    .expect(201);

  expect(response.body).toMatchObject({
    value: "value",
    translated: 'translated',
    wordCategoryId: wordCategory.body.wordCategoryId
  });
  expect(typeof response.body.wordId).toBe("number")
  expect(typeof response.body.createdAt).toBe("string")
});