<div class="box" on:click>
  <slot />
</div>

<style>
  .box {
    border-radius: 3px;
    padding: 10px;
    cursor: pointer;
    display: flex;
    margin: 10px 0;

    display: flex;
    box-shadow: 0 2px 3px rgb(111 123 138 / 11%);
    background-color: white;

    display: flex;
    justify-content: center;
    align-items: center;
  }

  .box:hover {
    background-color: #fbfbfb;
  }
</style>
