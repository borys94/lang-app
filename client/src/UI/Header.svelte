<script>
  import Menu from "./Menu/Menu.svelte";
  import navigation from "../services/navigation";

  let isMenuOpen = false;
</script>

{#if isMenuOpen}
  <Menu bind:isOpen={isMenuOpen} />
{/if}
<div class="header-container">
  <i class="eva eva-home-outline" on:click={() => navigation.goToHome()} />
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
    box-shadow: 0 0 27px -6px rgb(60 89 131 / 20%);
    background-color: white;
    position: fixed;
    left: 0;
    right: 0;
    z-index: 1;
  }

  i {
    font-size: 40px;
    cursor: pointer;
  }
</style>
