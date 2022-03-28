<script>
  import { Form, FormGroup, Input, Spinner } from "sveltestrap";
  import { fade } from "svelte/transition";

  import Button from "../UI/Button.svelte";
  import ErrorAlert from "../UI/ErrorAlert.svelte";

  import Api from "../services/api";
  import Navigation from "../services/navigation";
  import userStore from "../stores/user";

  let email = "";
  let password = "";
  let pending = false;
  let errors = null;

  const createAccount = async (event) => {
    event.preventDefault();
    pending = true;
    errors = null;

    try {
      const res = await Api.signUp(email, password);
      if (res.errors) {
        errors = res.errors;
      } else {
        userStore.signIn(res);
        Navigation.goToHome();
      }
    } catch (error) {
      console.error(error);
    } finally {
      pending = false;
    }
  };
</script>

<div in:fade={{ duration: 200 }} class="login">
  <div class="login-content">
    <h1>Create account</h1>
    {#if errors}
      <ErrorAlert {errors} />
    {/if}
    <Form>
      <FormGroup floating label="Username or email">
        <Input placeholder="Username or email" bind:value={email} />
      </FormGroup>
      <FormGroup floating label="Password">
        <Input placeholder="Password" type="password" bind:value={password} />
      </FormGroup>
      <Button color="blue" on:click={createAccount}>
        {#if pending}
          <Spinner color="light" />
        {:else}
          Create account
        {/if}
      </Button>
    </Form>
    <p>
      Already have an account? <span on:click={Navigation.goToLogin}
        >Sign in</span
      >
    </p>
  </div>
</div>

<style>
  .login {
    display: flex;
    flex-direction: column;
    margin: 10px 10px 50px 10px;
    justify-content: center;
    align-items: center;
    height: 100%;
  }
  .login-content {
    min-width: 300px;
  }

  h1 {
    text-align: center;
    margin-bottom: 40px;
  }

  p span {
    color: var(--bs-blue);
    text-decoration: underline;
    font-weight: bold;
    cursor: pointer;
  }
</style>
