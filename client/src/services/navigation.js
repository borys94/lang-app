import {push} from 'svelte-spa-router'

class Navigation {
  goToLogin = () => push('/login');
  goToRegister = () => push('/register');
  goToHome = () => push('/');
}

export default new Navigation();