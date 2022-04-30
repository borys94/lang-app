import request from 'supertest';
import { app } from '../../../app';

it('fails when an user is not authorized', async () => {
  await request(app)
    .delete('/api/words/categories/1')
    .expect(401);
});

it('fails when word does not exist', async () => {
  const cookie = await global.signin();
  await request(app)
    .delete(`/api/words/categories/1`)
    .set("Cookie", cookie)
    .expect(400);
});

it('fails when word is deleted 2 times', async () => {
  const cookie = await global.signin();
  const wordCategory = await global.addWordCategory(cookie, "name", "Spanish", "A1");
  await request(app)
    .delete(`/api/words/categories/${wordCategory.wordCategoryId}`)
    .set("Cookie", cookie)
    .expect(200);
  await request(app)
    .delete(`/api/words/categories/${wordCategory.wordCategoryId}`)
    .set("Cookie", cookie)
    .expect(400);
});

it('success when word category and his words are deleted', async () => {
  const cookie = await global.signin();
  const wordCategory = await global.addWordCategory(cookie, "name", "Spanish", "A1");
  await global.addWordCategory(cookie, "name2", "Spanish", "A1");
  await global.addWordCategory(cookie, "name3", "English", "A1");
  const word = await global.addWord(cookie, "value", "translated", wordCategory.wordCategoryId);

  await request(app)
    .delete(`/api/words/categories/${wordCategory.wordCategoryId}`)
    .set("Cookie", cookie)
    .expect(200);
  
  const wordCategories = await global.getWordCategories(cookie, "Spanish");
  expect(wordCategories.length).toBe(1);
  await request(app)
    .get(`/api/words/${word.wordId}`)
    .set("Cookie", cookie)
    .expect(400);
});
