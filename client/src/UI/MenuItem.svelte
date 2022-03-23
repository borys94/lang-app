
<style>
  div {
    height: 50px;
    width: 300px;
    background-color: #fff;
    border-bottom: 1px solid #ddd;
    display: flex;
    align-items: center;
    padding-left: 15px;
    cursor: pointer;
  }

  div:hover {
    background-color: #ddd;
  }
</style>

<div on:click>
  <slot />
</div>
