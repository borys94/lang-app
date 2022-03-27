<script>
  import Box from "../../UI/Box.svelte";
</script>

<Box on:click>
  <div class="box-content">
    <i class="eva eva-book-outline" />
    <div>1. Lesson 1</div>
    <i class="check-icon eva eva-checkmark-outline" />
  </div>
</Box>

<style>
  .box-content {
    display: flex;
    align-items: center;
    width: 100%;
  }

  .box-content i {
    font-size: 50px;
  }

  .check-icon {
    margin-left: auto;
    color: var(--bs-teal);
  }
</style>
