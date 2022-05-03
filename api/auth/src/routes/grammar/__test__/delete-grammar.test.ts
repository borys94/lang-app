import request from 'supertest';
import { app } from '../../../app';

it('fails when an user is not authorized', async () => {
  await request(app)
    .delete('/api/grammar/1')
    .expect(401);
});

it('fails when an user has no right', async () => {
  const cookie = await global.signin();

  await request(app)
    .delete('/api/grammar/1')
    .set("Cookie", cookie)
    .expect(401);
});

it('fails when grammar does not exist', async () => {
  const cookie = await global.signin("admin");
  await global.addGrammar(cookie, "name", "Spanish", "A1", "value");

  await request(app)
    .delete(`/api/grammar/9999999`)
    .set("Cookie", cookie)
    .expect(404);
});

it('success when try to delete a grammar two times', async () => {
  const cookie = await global.signin("admin");
  const grammar = await global.addGrammar(cookie, "name", "Spanish", "A1", "value");

  const response = await request(app)
    .delete(`/api/grammar/${grammar.grammarId}`)
    .set("Cookie", cookie)
    .expect(200);
  await request(app)
    .delete(`/api/grammar/${grammar.grammarId}`)
    .set("Cookie", cookie)
    .expect(404);

  expect(response.body).toEqual({});
});

it('success when delete a grammar', async () => {
  const cookie = await global.signin("admin");
  const grammar = await global.addGrammar(cookie, "name", "Spanish", "A1", "value");

  const response = await request(app)
    .delete(`/api/grammar/${grammar.grammarId}`)
    .set("Cookie", cookie)
    .expect(200);

  expect(response.body).toEqual({});
});