<script>
  import { Button } from "sveltestrap";
  import { fade } from "svelte/transition";

  import Box from "../UI/Box.svelte";
</script>

<div in:fade={{ duration: 200 }} class="container">
  <Box>
    <div class="box-content">
      <h1>Account data</h1>
      <div class="info">
        <div>Nickname:</div>
        <div>email:</div>
        <div>password: **********</div>
      </div>
      <Button color="primary">Edit</Button>
      <Button color="danger">Remove account</Button>
    </div>
  </Box>
</div>

<style>
  .container {
    max-width: 500px;
  }
  h1 {
    text-align: center;
    margin-bottom: 40px;
  }

  .box-content {
    width: 100%;
  }

  .info {
    margin: 20px 10px;
  }
</style>
