import request from 'supertest';
import { app } from '../../../app';

it('fails when an user is not authorized', async () => {
  await request(app)
    .get('/api/words/categories?lang=Spanish')
    .expect(401);
});

it('fails when an incorrect lang is supplied', async () => {
  const cookie = await global.signin();
  await request(app)
  .get('/api/words/categories?lang=NotExistedLang')
    .set("Cookie", cookie)
    .expect(400);
});

it('success when correct data is suplied and returns empty array', async () => {
  const cookie = await global.signin();
  const response = await request(app)
    .get('/api/words/categories?lang=Spanish')
    .set("Cookie", cookie)
    .expect(200);
  
  expect(response.body).toEqual([]);
});

it('success when an correct data is supplied', async () => {
  const cookie = await global.signin();
  await global.addWordCategory(cookie, "name", "Spanish", "A1");

  const response = await request(app)
    .get('/api/words/categories?lang=Spanish')
    .set("Cookie", cookie)
    .expect(200);
  expect(response.body.length).toBe(1);
  expect(response.body[0].name).toBe("name");
  expect(typeof response.body[0].wordCategoryId).toBe("number")
});

it('success when an correct data is supplied', async () => {
  const cookie = await global.signin();
  await global.addWordCategory(cookie, "name", "Spanish", "A1");
  await global.addWordCategory(cookie, "name_english", "English", "A1");

  const response = await request(app)
    .get('/api/words/categories?lang=English')
    .set("Cookie", cookie)
    .expect(200);
  expect(response.body.length).toBe(1);
  expect(response.body[0].name).toBe("name_english");
  expect(typeof response.body[0].wordCategoryId).toBe("number")
});