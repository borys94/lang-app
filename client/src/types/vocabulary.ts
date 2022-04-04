export interface Word {
  id: number;
  name: string;
  translated: string;
  lessonId: string;
}

export type Vocabulary = Word[]