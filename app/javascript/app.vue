<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      message: "こんにちは!",
    }
  },
};

var side_bar = new Vue({
	el: '#side_bar',
  data: {
    listitem: "こんにちは!"
  }
})
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
