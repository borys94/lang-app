<script>
  export let color = "green"
</script>

<button on:click class={color} {...$$props}>
  <slot />
</button>

<style>
  button {
    border: none;
    padding: 12px 24px;
    font-size: 16px;
    font-weight: 300;
    color: #fff !important;
    cursor: pointer;
    outline: none;
    text-decoration: none !important;
    display: inline-block;
    transition: all 150ms;
    margin: 5px 0;
    position: relative;
  }

  button:hover {
    opacity: 0.85;
  }

  button:disabled {
    cursor: not-allowed;
    opacity: 0.6;
  }

  .green {
    background-color: var(--color-green);
  }

  .blue {
    background-color: var(--color-blue);
  }

  .yellow {
    background-color: var(--color-yellow);
  }

  .red {
    background-color: var(--color-red);
  }

  .purple {
    background-color: var(--color-purple);
  }

  .dark {
    background-color: var(--color-dark);
  }
</style>
