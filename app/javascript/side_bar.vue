<template>
  <div id="side_bar">
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
  }  
};
</script>