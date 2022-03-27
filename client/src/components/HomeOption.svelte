<script>
  import Box from "../UI/Box.svelte";
</script>

<Box>
  <div class="box-content">
    <i class="eva eva-book-outline" />
    <span>Lessons</span>
    <i class="eva eva-arrow-ios-forward-outline" />
  </div>
</Box>

<style>
  .box-content {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  i {
    font-size: 30px;
  }

  i:last-of-type {
    margin-left: auto;
  }
</style>
