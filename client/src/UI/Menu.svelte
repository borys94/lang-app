<script>
  import {fade, fly} from "svelte/transition";
  import {push, location} from 'svelte-spa-router'

  import MenuItem from "./MenuItem.svelte";

  import Api from "../services/api";
  import Navigation from "../services/navigation";

  import userStore from "../stores/user"

  export let isOpen = false

  let loading = false;

  let currentLink = $location;
  $: if (currentLink !== $location) {
    isOpen = false;
    currentLink = $location
  }

  const goTo = (path) => {
    isOpen = false
    push(path);
  }

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
  }

</script>

<style>
  .menu-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 10px;
    position: absolute;
    z-index: 1;
    top: 0;
    bottom: 0;
    background-color: white;
  }

  .background {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: #000c;
    z-index: 1;
  }
</style>

<div transition:fade={{duration: 200}} class="background" on:click={() => isOpen = false} />

<div transition:fly={{duration: 200, x: -300}} class="menu-container">
  <MenuItem on:click={() => goTo("/")}>Home</MenuItem>
  <MenuItem on:click={() => goTo("/lesson")}>Lessons</MenuItem>
  <MenuItem on:click={() => goTo("/training")}>Training</MenuItem>
  <MenuItem on:click={signOut}>Sign out</MenuItem>
</div>
