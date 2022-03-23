<script>
  import { Alert } from "sveltestrap";

  export let errors;
</script>

<Alert color="danger" fade={false}>
  <ul>
    {#each errors as error (error.message)}
      <li>{error.message}</li>
    {/each}
  </ul>
</Alert>

<style>
  ul {
    margin-bottom: 0;
  }
</style>
