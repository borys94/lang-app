<div on:click>
  <slot />
</div>

<style>
  div {
    height: 50px;
    width: 300px;
    background-color: #fff;
    display: flex;
    align-items: center;
    padding-left: 15px;
    cursor: pointer;
  }

  div:hover {
    background-color: #ddd;
  }
</style>
