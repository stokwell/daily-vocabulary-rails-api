<template>
  <div id="app">
    <div v-for="word in words">
      {{ word.original }}
    </div>
  </div>
</template>

<script>
export default {
  props: ["words"],
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
