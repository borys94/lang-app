import { writable, get } from "svelte/store";

const userData = writable({
  id: null,
  email: null
});

const userStore = {
  subscribe: userData.subscribe,

  signIn: (data) => {
    console.log(data)
    userData.update(() => ({
      id: data.id,
      email: data.email
    }));
  },

  signOut: () => {
    userData.update(() => ({
      id: null,
      email: null
    }));
  },

  isLogged: () => {
    return !!get(userStore).id
  },

  getData: () => {
    return get(userStore)
  }
};

export default userStore;
