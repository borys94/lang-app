export type LangType = "English" | "Sanish" | "German";

export default class Language {
  static set(lang: LangType) {
    localStorage.setItem("lang", lang);
  }

  static get(): LangType {
    return localStorage.getItem("lang") as LangType || "Spanish";
  }
}