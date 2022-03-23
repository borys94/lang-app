<script>
  import Router from 'svelte-spa-router';
  import {wrap} from 'svelte-spa-router/wrap'
  
  import Training from "./views/Training.svelte";
  import Lesson from "./views/Lesson.svelte";
  import Home from "./views/Home.svelte";
  import Login from "./views/Login.svelte";
  import Register from "./views/Register.svelte";
  import NotFound from "./views/NotFound.svelte";

  import userStore from "./stores/user";
  import Navigation from "./services/navigation";

  const routes = {
    '/': wrap({
      component: Home,
      conditions: [() => userStore.isLogged()]
    }),
    '/training': wrap({
      component: Training,
      conditions: [() => userStore.isLogged()]
    }),
    '/lesson': wrap({
      component: Lesson,
      conditions: [() => userStore.isLogged()]
    }),
    '/login': wrap({
      component: Login,
      conditions: [() => !userStore.isLogged()]
    }),
    '/register': wrap({
      component: Register,
      conditions: [() => !userStore.isLogged()]
    }),
    '*': NotFound,
  }

  const onConditionsFailed = (event) => {
    if (["/login", "/register"].includes(event.detail.route)) {
      Navigation.goToHome();
    } else {
      Navigation.goToLogin();
    }
  }
</script>

<Router {routes} on:conditionsFailed={onConditionsFailed}/>