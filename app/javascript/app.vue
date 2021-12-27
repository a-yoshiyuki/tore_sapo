<template>
  <div id="app">
    <p>{{ message }}</p>
    <p>{{message}}</p>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      message: "Hello Vuw11111!",
    }
  },
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
