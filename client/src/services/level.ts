export type LevelType = "A1" | "A2" | "B1" | "B2" | "C1" | "C2" ;

export default class Level {
  static set(lang: LevelType) {
    localStorage.setItem("level", lang);
  }

  static get(): LevelType {
    return localStorage.getItem("level") as LevelType || "A1";
  }
}