import request from "supertest";
import jwt from "jsonwebtoken";

import { WordCategoryResponse, WordResponse, Lang, LangLevel } from "../types/responses";

import { app } from "../app";

declare global {
  function signin(): string[];
  function addWord(cookie: string[], value: string, translated: string, wordCategoryId: number): Promise<WordResponse>;
  function addWordCategory(cookie: string[], name: string, lang: Lang, level: LangLevel): Promise<WordCategoryResponse>;
  function getWordCategories(cookie: string[], lang: Lang): Promise<WordCategoryResponse[]>;
  function getWord(cookie: string[], wordId: number): Promise<WordResponse>;
}

global.signin = () => {
  const payload = {
    id: 10,
    email: "test@test.com",
  };

  const token = jwt.sign(payload, process.env.JWT_KEY!);
  const session = { jwt: token };
  const sessionJSON = JSON.stringify(session);
  const base64 = Buffer.from(sessionJSON).toString("base64");

  return [`session=${base64}`];
};

global.addWordCategory = async (
  cookie: string[],
  name: string,
  lang: Lang,
  level: LangLevel
): Promise<WordCategoryResponse> => {
  return (await request(app)
    .post("/api/words/categories")
    .set("Cookie", cookie)
    .send({
      name,
      lang,
      level,
    })).body;
}

global.addWord = async (
  cookie: string[],
  value: string,
  translated: string,
  wordCategoryId: number
): Promise<WordResponse> => {
  return (await request(app)
    .post("/api/words")
    .set("Cookie", cookie)
    .send({
      value,
      translated,
      wordCategoryId,
    })).body;
}

global.getWordCategories = async (
  cookie: string[],
  lang: Lang,
): Promise<WordCategoryResponse[]> => {
  return (await request(app)
    .get(`/api/words/categories?lang=${lang}`)
    .set("Cookie", cookie)
  ).body
}

global.getWord = async (
  cookie: string[],
  wordId: number,
): Promise<WordResponse> => {
  return (await request(app)
    .get(`/api/words/${wordId}`)
    .set("Cookie", cookie)
  ).body
}