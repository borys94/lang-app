<script>
  import { fade } from "svelte/transition";

  import Card from "../UI/Card.svelte";
  import Option from "../UI/Option.svelte";
</script>

<div in:fade={{ duration: 200 }} class="home-view">
  <Option>Daily training</Option>
  <Option>Lessons</Option>
</div>

<style>
  .home-view {
    display: flex;
    flex-direction: column;
    margin: 10px;
    justify-content: center;
    align-items: center;
  }
</style>
