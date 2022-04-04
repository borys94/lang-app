import {CurrentUser} from "$types/user";
import {Lessons, Lesson, LessonExtended} from "$types/lessons";

class Api {
  async signIn(email: string, password: string) {
    return this.post("/api/users/signin", { email, password });
  }

  async signUp(email: string, password: string) {
    return this.post("/api/users/signup", { email, password });
  }

  async signOut(): Promise<void> {
    return this.post("/api/users/signout", {});
  }

  async getCurrentUser(): Promise<CurrentUser> {
    return this.get("/api/users/currentUser");
  }


  async getVocabulary() {
    return this.get("/api/vocabulary");
  }

  // async addWord(value: string, translated: string) {
  //   return this.post("/api/vocabulary/words", {
  //     value,
  //     translated
  //   });
  // }


  async getLessons(): Promise<Lessons> {
    return this.get("/api/lessons");
  }

  async addLesson(name: string, lang: string, level: string): Promise<Lesson> {
    return this.post("/api/lessons", {
      name,
      lang,
      level
    });
  }

  async getLesson(id: string): Promise<LessonExtended> {
    return this.get(`/api/lessons/${id}`);
  }

  async addWord(lessonId: number, value: string, translated: string): Promise<LessonExtended> {
    return this.post(`/api/lessons/${lessonId}/vocabulary`, {
      value,
      translated
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

  async addWordToTraining(wordId: number): Promise<void> {
    await this.post(`/api/training`, {
      wordId
    });
  }

  async addSentenceToTraining(sentenceId: number): Promise<void> {
    await this.post(`/api/training`, {
      sentenceId
    });
  }

  async getTraining(): Promise<void> {
    return this.get(`/api/training/today`);
  }

  async updateTraining(id: number, note: number) {
    return this.put(`/api/training/${id}`, {
      note
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
