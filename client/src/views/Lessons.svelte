<script>
  import { fade } from "svelte/transition";

  import Lesson from "../components/Lessons/Lesson.svelte";
  import navigation from "../services/navigation";
</script>

<div in:fade={{ duration: 200 }} class="container">
  <div class="row">
    <div class="col-md-6">
      <Lesson on:click={() => navigation.goToLesson(1)} />
    </div>
    <div class="col-md-6">
      <Lesson on:click={() => navigation.goToLesson(2)} />
    </div>
    <div class="col-md-6">
      <Lesson on:click={() => navigation.goToLesson(3)} />
    </div>
  </div>
</div>
