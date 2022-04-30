import {CurrentUser} from "$types/user";
import {Lessons, Lesson, LessonExtended} from "$types/lessons";
import {LangType} from "$services/language";



class Api {
  async signIn(email: string, password: string) {
    return this.post("/api/api/users/signin", { email, password });
  }

  async signUp(email: string, password: string) {
    return this.post("/api/api/users/signup", { email, password });
  }

  async signOut(): Promise<void> {
    return this.post("/api/api/users/signout", {});
  }

  async getCurrentUser(): Promise<CurrentUser> {
    return this.get("/api/api/users/currentUser");
  }


  async getVocabulary() {
    return this.get("/api/vocabulary");
  }

  async getLessons(lang: LangType) {
    return this.get(`/api/lessons?lang=${lang}`);
  }

  async addLesson(name: string, lang: string, level: string): Promise<Lesson> {
    return this.post("/api/lessons", {
      name,
      lang,
      level
    });
  }

  async getLesson(id: string) {
    return this.get(`/api/lessons/${id}/words`);
  }

  async addWord(lessonId: number, value: string, translated: string, type: string): Promise<LessonExtended> {
    return this.post(`/api/lessons/${lessonId}`, {
      value,
      translated,
      type
    });
  }

  async addSentence(lessonId: number, value: string, translated: string): Promise<LessonExtended> {
    return this.post(`/api/lessons/${lessonId}/sentence`, {
      value,
      translated
    });
  }

  async removeWord(id: number): Promise<void> {
    await this.delete(`/api/vocabulary/${id}`);
  }

  async addWordToTraining(userId: number, externalId: number, lang: LangType, type: string): Promise<void> {
    await this.post(`/api/training`, {
      externalId,
      userId,
      lang,
      type
    });
  }

  async getTraining(): Promise<any> {
    return this.get(`/api/training/today`);
  }

  async updateTraining(id: number, wordId: number, note: number) {
    return this.post(`/api/training/${id}/notes/${wordId}`, {
      note
    });
  }

  async getWordsInLessons(isGrammar: boolean = false) {
    return this.get(`/api/training/wordsInLessons?isGrammar=${isGrammar}`);
  }

  async getWordsInLesson(lessonId: number, isGrammar: boolean = false) {
    return this.get(`/api/training/wordsInLessons/${lessonId}?isGrammar=${isGrammar}`);
  }

  async getGrammars(lang: string) {
    return this.get(`/api/grammars?lang=${lang}`);
  }

  async getGrammar(id: string) {
    return this.get(`/api/grammars/${id}`);
  }

  async addGrammar(name: string, lang: string, level: string, value: string) {
    return this.post(`/api/grammars`, {
      name,
      lang,
      level,
      value
    });
  }

  async editGrammar(grammarId: number, name: string, lang: string, level: string, value: string) {
    return this.put(`/api/grammars/${grammarId}`, {
      name,
      lang,
      level,
      value
    });
  }

  async addGrammarExample(grammarId: number, value: string, translated: string) {
    return this.post(`/api/grammar/${grammarId}/examples`, {
      translated,
      value
    });
  }


  async addExercise(grammarId: number, name: string) {
    return this.post(`/api/grammar/${grammarId}/exercise`, {
      name,
    });
  }

  async editExercise(grammarId: number, excerciseId: number, name: string) {
    return this.put(`/api/grammar/${grammarId}/exercise/${excerciseId}`, {
      name,
    });
  }

  async getExercises(grammarId: number) {
    return this.get(`/api/grammar/${grammarId}/exercises`);
  }

  async addSubExercise(grammarId: number, exerciseId: string, value: string, answers: string) {
    return this.post(`/api/grammar/${grammarId}/exercise/${exerciseId}`, {
      value,
      answers
    });
  }

  async editSubExercise(grammarId: number, exerciseId: string, subExerciseId: string, value: string, answers: string) {
    return this.put(`/api/grammar/${grammarId}/exercise/${exerciseId}/sub/${subExerciseId}`, {
      value,
      answers,
    });
  }

  async getAllExercises() {
    return this.get(`/api/exercises`);
  }

  async getExercise(id: string) {
    return this.get(`/api/exercises/${id}`);
  }

  async getSubExercises(id: string) {
    return this.get(`/api/exercises/${id}/subExercise`);
  }

  async getSubExercise(id: string, subId: string) {
    return this.get(`/api/exercises/${id}/subExercise/${subId}`);
  }

  async createExercise(title: string, lang: string, level: string) {
    return this.post(`/api/exercises`, {
      title,
      lang,
      level,
    });
  }

  async createSubExercise(exerciseId: string, title: string, text: string, answers: string) {
    return this.post(`/api/exercises/${exerciseId}`, {
      text,
      title,
      answers
    });
  }

  async updateSubExercise(id: string, subId: number, title: string, text: string, answers: string) {
    return this.put(`/api/exercises/${id}/subExercise/${subId}`, {
      text,
      title,
      answers
    });
  }




  async post(path: string, body: unknown) {
    return (
      await fetch(path, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(body),
      })
    ).json();
  }

  async get(path: string) {
    return (
      await fetch(path, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      })
    ).json();
  }

  async delete(path: string) {
    return (
      await fetch(path, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
        },
      })
    ).json();
  }

  async put(path: string, body: unknown) {
    return (
      await fetch(path, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(body),
      })
    ).json();
  }
}

export default new Api();
