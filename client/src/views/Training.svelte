<script>
  import {fade} from "svelte/transition";
  
  import Card from "../UI/Card.svelte";


</script>

<style>
  .training-container {
    display: flex;
    flex-direction: column;
    margin: 10px;
    justify-content: center;
    align-items: center;
  }
</style>

<div in:fade={{duration: 200}} class="training-container">
  <p>2/32</p>
  <Card />
</div>
