<script>
  import { fade, fly } from "svelte/transition";
  import { push, location } from "svelte-spa-router";

  import MenuItem from "./MenuItem.svelte";
  import SubMenuItem from "./SubMenuItem.svelte";
  import Header from "./Header.svelte";
  import Disclaimer from "./Disclaimer.svelte";

  import Api from "../../services/api";
  import Navigation from "../../services/navigation";

  import userStore from "../../stores/user";

  export let isOpen = false;

  let loading = false;

  let currentLink = $location;
  $: if (currentLink !== $location) {
    isOpen = false;
    currentLink = $location;
  }

  const goTo = (path) => {
    isOpen = false;
    push(path);
  };

  const signOut = async () => {
    loading = true;
    try {
      await Api.signOut();
      userStore.signOut();
      Navigation.goToLogin();
    } catch (error) {
    } finally {
      loading = false;
    }
  };
</script>

<div
  transition:fade={{ duration: 300 }}
  class="background"
  on:click={() => (isOpen = false)}
/>

<div transition:fly={{ duration: 200, x: -300 }} class="menu-container">
  <Header />
  <MenuItem on:click={() => goTo("/")}>Home</MenuItem>
  <MenuItem on:click={() => goTo("/lesson")}>Lessons</MenuItem>
  <MenuItem on:click={() => goTo("/training")}>Training</MenuItem>
  <Disclaimer />
  <MenuItem>Languages</MenuItem>
  <SubMenuItem>English</SubMenuItem>
  <SubMenuItem>Spanish</SubMenuItem>
  <SubMenuItem>German</SubMenuItem>
  <Disclaimer />
  <MenuItem on:click={signOut}>Sign out</MenuItem>
</div>

<style>
  .menu-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    position: absolute;
    z-index: 1;
    top: 0;
    bottom: 0;
    background-color: white;
    box-shadow: 0 -3px 8px rgb(0 0 0 / 25%);
  }

  .background {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: #0007;
    z-index: 1;
  }
</style>
