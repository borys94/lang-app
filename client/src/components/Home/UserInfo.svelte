<script>
  import Box from "../../UI/Box.svelte";
</script>

<Box on:click>
  <div class="box-content">
    <div>
      <i class="eva eva-person-outline" />
    </div>
    <div class="info">
      <div>Marcin</div>
      <div>2 day</div>
    </div>
    <div class="settings">
      <i class="eva eva-settings-outline" />
    </div>
  </div>
</Box>

<style>
  .box-content {
    width: 100%;
    height: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .info {
    padding-left: 10px;
  }

  i {
    font-size: 50px;
  }

  .settings {
    margin-left: auto;
    align-self: flex-start;
  }

  .settings i {
    font-size: 22px;
  }

  .settings i:hover {
    color: var(--bs-blue);
  }
</style>
