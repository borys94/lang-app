<script>
  import userStore from "../../stores/user";
</script>

<div class="menu-header">
  <div>
    <i class="eva eva-person-outline" />
  </div>
  <div>
    {$userStore.email}
  </div>
</div>

<style>
  .menu-header {
    height: 60px;
    width: 100%;
    background-color: #eee;
    border-bottom: 1px solid #ddd;
    display: flex;
    align-items: center;
    padding-left: 15px;
    cursor: pointer;
  }

  i {
    font-size: 30px;
    margin-right: 10px;
  }
</style>
