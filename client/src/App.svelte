<script>
  import {onMount} from "svelte";
  import { Spinner } from 'sveltestrap';
  import {fade} from "svelte/transition"

  import Api from "./services/api";
  import userStore from "./stores/user";
  import Navigation from "./services/navigation";

  import Header from "./UI/Header.svelte";
  import Routes from "./Routes.svelte"

  let loading = true;
  onMount(async () => {
    const {currentUser} = await Api.getCurrentUser();
    if (currentUser) {
      userStore.signIn(currentUser);
    } else {
      Navigation.goToLogin();
    }
    loading = false
  })
</script>

<style>
  .loader-container {
    display: flex;
    justify-content: center;
    align-items: center;
    position: absolute;
    right: 0;
    left: 0;
    top: 0;
    bottom: 0;
    width: 100%;
    background-color: white;
  }
</style>

{#if loading}
  <div class="loader-container" out:fade={{duration: 200}}>
    <Spinner color="dark" />
  </div>
{:else}
  {#if $userStore.id}
    <Header />
  {/if}
  <Routes />
{/if}
