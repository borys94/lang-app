<script>
  import Menu from "./Menu/Menu.svelte";

  let isMenuOpen = false;
</script>

{#if isMenuOpen}
  <Menu bind:isOpen={isMenuOpen} />
{/if}
<div class="header-container">
  <i class="eva eva-menu" on:click={() => (isMenuOpen = !isMenuOpen)} />
</div>

<style>
  .header-container {
    height: 50px;
    border-bottom: 1px solid #ddd;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 10px;
    margin-bottom: 10px;
  }

  i {
    font-size: 40px;
    cursor: pointer;
  }
</style>
