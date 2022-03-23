

<script>
  import { Alert } from 'sveltestrap';

  export let errors;
</script>

<style>
  ul {
    margin-bottom: 0
  }
</style>

<Alert color="danger" fade={false} >
  <ul>
    {#each errors as error (error.message)}
      <li>{error.message}</li>
    {/each}
  </ul>
</Alert>
