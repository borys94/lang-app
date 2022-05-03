export type Lang = "Spanish" | "English" | "German";
export type LangLevel = "A1" | "A2" | "B1" | "B2" | "C1" | "C2";

export interface WordCategory {
  wordCategoryId: number;
  name: string;
  lang: Lang;
  level: LangLevel;
  createdAt: string;
}

export interface Word {
  wordId: number;
  wordCategoryId: number;
  value: string;
  translated: string;
  createdAt: string;
}

export interface Grammar {
  grammarId: number;
  name: string;
  lang: Lang;
  level: LangLevel;
  value: string;
  createdAt: string;
}

export interface GrammarExtended extends Grammar {
  exercises: GrammarExercise[];
}

export interface GrammarExercise {
  grammarExerciseId: number;
  grammarId: number;
  name: string;
  value: string;
  createdAt: string;
  answers: string;
}