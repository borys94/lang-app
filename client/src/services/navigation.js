import { push } from "svelte-spa-router";

class Navigation {
  goToLogin = () => push("/login");
  goToRegister = () => push("/register");
  goToHome = () => push("/");
  goToLessons = () => push("/lessons");
  goToLesson = (id) => push(`/lessons/${id}`);
  goToTraining = () => push("/training");
  goToUser = () => push("/user");
}

export default new Navigation();
