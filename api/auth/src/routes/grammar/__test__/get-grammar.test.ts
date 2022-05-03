import request, { Response } from 'supertest';
import { app } from '../../../app';

it('fails when a grammar does not exist', async () => {
  await request(app)
    .get('/api/grammar/999999999')
    .expect(404);
});

it('success when gets a grammar', async () => {
  const cookie = await global.signin("admin");
  const grammar = await global.addGrammar(cookie, "name", "German", "C1", "value");

  const response = await request(app)
    .get(`/api/grammar/${grammar.grammarId}`)
    .set("Cookie", cookie)
    .expect(200);
  expect(response.body).toMatchObject({
    name: "name",
    lang: "German",
    level: "C1",
    value: "value"
  });
});

it('success when gets a grammar as not logged user', async () => {
  const cookie = await global.signin("admin");
  const grammar = await global.addGrammar(cookie, "name", "English", "C2", "value");

  const response = await request(app)
    .get(`/api/grammar/${grammar.grammarId}`)
    .expect(200);
  expect(response.body).toMatchObject({
    name: "name",
    lang: "English",
    level: "C2",
    value: "value"
  });
});

it('success when gets a grammar with exercises', async () => {
  const cookie = await global.signin("admin");
  const grammar = await global.addGrammar(cookie, "name", "English", "C2", "value");
  const exercise = await global.addExercise(cookie, grammar.grammarId, "name", "value", "answers");

  const response = await request(app)
    .get(`/api/grammar/${grammar.grammarId}`)
    .expect(200);
  expect(response.body).toMatchObject({
    name: "name",
    lang: "English",
    level: "C2",
    value: "value"
  });
  expect(response.body.exercises).toMatchObject([exercise]);
});