<script>

  let flipped = false;
</script>

<style>
  .container {
    height: 200px;
    width: 200px;
    border-radius: 20px;
    cursor: pointer;
    display: flex;
    margin: 10px;
    /* overflow: hidden; */
  }

  /* The flip card container - set the width and height to whatever you want. We have added the border property to demonstrate that the flip itself goes out of the box on hover (remove perspective if you don't want the 3D effect */
.flip-card {
  background-color: transparent;
  width: 300px;
  height: 200px;
  border: 1px solid #f1f1f1;
  perspective: 1000px; /* Remove this if you don't want the 3D effect */
}

/* This container is needed to position the front and back side */
.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.3s;
  transform-style: preserve-3d;
  font-size: 32px;
}


.flipped {
  transform: rotateY(180deg);
}

/* Position the front and back side */
.flip-card-front, .flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden; /* Safari */
  backface-visibility: hidden;
}

/* Style the front side (fallback if image is missing) */
.flip-card-front {
  background-color: #bbb;
  color: black;
  border-radius: 20px;
  display: flex;
  box-shadow: 0 0 20px #ddd;
    background-color: white;
}

/* Style the back side */
.flip-card-back {
  background-color: dodgerblue;
  color: black;
  transform: rotateY(180deg);
  border-radius: 20px;
  display: flex;
  box-shadow: 0 0 20px #ddd;
    background-color: white;
}

.flip-card-front div {
  margin: auto;
}

.flip-card-back div {
  margin: auto;
}
</style>


<div class="container" on:click={() => flipped = !flipped}>
  <div class="flip-card">
    <div class="flip-card-inner" class:flipped={flipped}>
      <div class="flip-card-front">
        <div>Hola</div>
      </div>
      <div class="flip-card-back">
        <div>Cześć</div>
      </div>
    </div>
  </div>
</div>
