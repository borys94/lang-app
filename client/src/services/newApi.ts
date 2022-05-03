import {Lesson, LessonExtended} from "$types/lessons";
import axios from "axios"

class Api {
  async addWordCategory(name: string, lang: string, level: string): Promise<Lesson> {
    return axios.post('/api/api/words/categories', {
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
