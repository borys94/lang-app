<script>
  import { Button, Form, FormGroup, Input, Spinner } from "sveltestrap";
  import { fade } from "svelte/transition";

  import ErrorAlert from "../UI/ErrorAlert.svelte";

  import Api from "../services/api";
  import Navigation from "../services/navigation";

  import userStore from "../stores/user";

  let email = "";
  let password = "";
  let pending = false;
  let errors = null;

  const signIn = async (event) => {
    pending = true;
    errors = null;
    event.preventDefault();
    try {
      const res = await Api.signIn(email, password);
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

  const goToRegister = () => {
    Navigation.goToRegister();
  };
</script>

<div in:fade={{ duration: 200 }} class="login">
  <div class="login-content">
    <h1>Sign in</h1>
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
      <Button disabled={pending} block color="primary" on:click={signIn}>
        {#if pending}
          <Spinner color="light" />
        {:else}
          Sign in
        {/if}
      </Button>
    </Form>
    <p>
      Don't have an account? <span on:click={goToRegister}>Create on now</span>
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

  h1 {
    text-align: center;
    margin-bottom: 40px;
  }

  .login-content {
    min-width: 300px;
  }

  p span {
    color: var(--bs-blue);
    text-decoration: underline;
    font-weight: bold;
    cursor: pointer;
  }
</style>
