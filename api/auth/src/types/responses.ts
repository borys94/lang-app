export type Lang = "Spanish" | "English" | "German";
export type LangLevel = "A1" | "A2" | "B1" | "B2" | "C1" | "C2";

export interface WordCategoryResponse {
  wordCategoryId: number;
  name: string;
  lang: Lang;
  level: LangLevel;
  createdAt: string;
}

export interface WordResponse {
  wordId: number;
  wordCategoryId: number;
  value: string;
  translated: string;
  createdAt: string;
}

export interface GrammarResponse {
  grammarId: number;
  lang: Lang;
  level: LangLevel;
  value: string;
  createdAt: string;
  exercises?: GrammarExerciseResponse[]
}

export interface GrammarExerciseResponse {
  grammarExerciseId: number;
  grammarId: number;
  name: string;
  value: string;
  createdAt: string;
}