export type Lang = "Spanish" | "English" | "German";
export type LangLevel = "A1" | "A2" | "B1" | "B2" | "C1" | "C2";

export interface WordCategoryResponse {
  wordCategoryId: number;
  name: string,
  lang: Lang,
  level: LangLevel
}

export interface WordResponse {
  wordId: number;
  wordCategoryId: number;
  value: string,
  translated: string,
}