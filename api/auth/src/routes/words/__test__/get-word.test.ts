import request from 'supertest';
import { app } from '../../../app';

it('fails when an user is not authorized', async () => {
  await request(app)
    .get('/api/words/1')
    .expect(401);
});

it('fails when word does not exist', async () => {
  const cookie = await global.signin();
  await request(app)
    .get('/api/words/1')
    .set("Cookie", cookie)
    .expect(400);
});

it('fails when an incorrect lang is supplied', async () => {
  const cookie = await global.signin();
  const wordCategory = await global.addWordCategory(cookie, "name", "Spanish", "A1");
  const word = await global.addWord(cookie, "value", "translated", wordCategory.wordCategoryId);
  const response = await request(app)
    .get(`/api/words/${word.wordId}`)
    .set("Cookie", cookie)
    .expect(200);
  
    expect(typeof response.body.wordId).toBe("number")
});
