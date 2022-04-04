export interface Lesson {
  id: number;
  name: string;
  lang: string;
  level: string;
}

export type Lessons = Lesson[]

interface Word {
  id: number;
  value: string;
  translated: string;
  lessonId: string;
}

export type Vocabulary = Word[];
export type Sentences = Vocabulary

export interface LessonExtended {
  lesson: Lesson,
  vocabulary: Vocabulary,
  sentences: Sentences
}