<script>
  import { fade } from "svelte/transition";
  import { ListGroup, ListGroupItem } from "sveltestrap";
</script>

<div in:fade={{ duration: 200 }} class="admin-view">
  <h1>Admin Panel</h1>
  <ListGroup>
    <ListGroupItem active tag="a" href="https://svelte.dev" action>
      Users
    </ListGroupItem>
    <ListGroupItem tag="a" href="https://svelte.dev" action
      >Lessons</ListGroupItem
    >
  </ListGroup>
</div>

<style>
  .admin-view {
    min-width: 300px;
    display: flex;
    flex-direction: column;
    margin: 10px;
  }
</style>
