<script>
  import Box from "../../UI/Box.svelte";

  export let title;
  export let evaIcon;
</script>

<Box on:click>
  <div class="box-content">
    <i class={`eva ${evaIcon}`} />
    <span>{title}</span>
    <i class="eva eva-arrow-ios-forward-outline" />
  </div>
</Box>

<style>
  .box-content {
    width: 100%;
    height: 60px;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  span {
    padding-left: 10px;
  }

  i {
    font-size: 30px;
  }

  i:last-of-type {
    margin-left: auto;
  }
</style>
