<script>
  import { fade } from "svelte/transition";

  import DailyTrainingBox from "../components/Home/DailyTrainingBox.svelte";
  import LessonsBox from "../components/Home/LessonsBox.svelte";
  import UserInfo from "../components/Home/UserInfo.svelte";
  import DifficultWords from "../components/Home/DifficultWords.svelte";

  import navigation from "../services/navigation";
</script>

<div in:fade={{ duration: 200 }} class="home-view">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-sm-12">
        <UserInfo on:click={() => navigation.goToUser()} />
      </div>
      <div class="col-md-6 col-sm-12">
        <DailyTrainingBox on:click={() => navigation.goToTraining()} />
        <LessonsBox on:click={() => navigation.goToLessons()} />
        <DifficultWords on:click={() => navigation.goToTraining()} />
      </div>
    </div>
  </div>
</div>

<style>
  .home-view {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }
</style>
