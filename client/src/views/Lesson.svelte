<script>
  import {fade} from "svelte/transition";
  
  import Button from "../UI/Button.svelte";


</script>

<style>
  .container {
    margin: 10px;
  }
  i {
    color: green;
  }

  .word {
    display: flex;
    margin: 5px 0;
    height: 25px;
  }

  p {
    margin: 0 0 0 20px;
    position: absolute;
  }
</style>

<div in:fade={{duration: 200}} class="container">
  <h1>Lesson 1</h1>
  <h2>Vocabulary</h2>
  <div class="word">
    <i class="eva eva-checkmark-outline"></i>
    <p>
      <b>adiós</b> - do widzenia; żegnaj
    </p>
  </div>
  <div class="word">
    <i class="eva eva-checkmark-outline"></i>
    <p>
      <b>adiós</b> - do widzenia; żegnaj
    </p>
  </div>
  <div class="word">
    <p>
      <b>adiós</b> - do widzenia; żegnaj
    </p>
  </div>
  <div class="word">
    <i class="eva eva-checkmark-outline"></i>
    <p>
      <b>adiós</b> - do widzenia; żegnaj
    </p>
  </div>

  <h2>Sentences</h2>
  <div class="word">
    <i class="eva eva-checkmark-outline"></i>
    <p>
      <b>adiós</b> - do widzenia; żegnaj
    </p>
  </div>
  <div class="word">
    <i class="eva eva-checkmark-outline"></i>
    <p>
      <b>adiós</b> - do widzenia; żegnaj
    </p>
  </div>

  <Button>Next</Button>
</div>
