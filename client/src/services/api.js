class Api {
  async signIn(email, password) {
    return this.post("https://127.0.0.1/api/users/signin", { email, password });
  }

  async signUp(email, password) {
    return this.post("https://127.0.0.1/api/users/signup", { email, password });
  }

  async signOut() {
    return this.post("https://127.0.0.1/api/users/signout", {});
  }

  async getCurrentUser() {
    return this.get("https://127.0.0.1/api/users/currentUser");
  }

  async post(path, body) {
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

  async get(path) {
    return (
      await fetch(path, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      })
    ).json();
  }
}

export default new Api();
