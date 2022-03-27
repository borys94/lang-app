<script>
  import Router from "svelte-spa-router";
  import { wrap } from "svelte-spa-router/wrap";

  import Training from "./views/Training.svelte";
  import Lessons from "./views/Lessons.svelte";
  import Lesson from "./views/Lesson.svelte";
  import Home from "./views/Home.svelte";
  import Login from "./views/Login.svelte";
  import Register from "./views/Register.svelte";
  import User from "./views/User.svelte";
  import NotFound from "./views/NotFound.svelte";
  import AdminHome from "./views/admin/Home.svelte";

  import userStore from "./stores/user";
  import Navigation from "./services/navigation";

  const routes = {
    "/": wrap({
      component: Home,
      conditions: [() => userStore.isLogged()],
    }),
    "/training": wrap({
      component: Training,
      conditions: [() => userStore.isLogged()],
    }),
    "/lessons": wrap({
      component: Lessons,
      conditions: [() => userStore.isLogged()],
    }),
    "/lessons/:lesson_id": wrap({
      component: Lesson,
      conditions: [() => userStore.isLogged()],
    }),
    "/login": wrap({
      component: Login,
      conditions: [() => !userStore.isLogged()],
    }),
    "/register": wrap({
      component: Register,
      conditions: [() => !userStore.isLogged()],
    }),
    "/user": wrap({
      component: User,
      conditions: [() => userStore.isLogged()],
    }),
    "/admin": wrap({
      component: AdminHome,
      conditions: [() => userStore.isLogged()],
    }),
    "*": NotFound,
  };

  const onConditionsFailed = (event) => {
    if (["/login", "/register"].includes(event.detail.route)) {
      Navigation.goToHome();
    } else {
      Navigation.goToLogin();
    }
  };
</script>

<Router {routes} on:conditionsFailed={onConditionsFailed} />
