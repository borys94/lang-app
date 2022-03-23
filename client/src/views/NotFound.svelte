<script>
  import { fade } from "svelte/transition";
</script>

<div in:fade={{ duration: 200 }} class="not-found-view">
  <h1>Not found</h1>
</div>

<style>
  .not-found-view {
    display: flex;
    flex-direction: column;
    margin: 10px;
    justify-content: center;
  }

  h1 {
    text-align: center;
  }
</style>
