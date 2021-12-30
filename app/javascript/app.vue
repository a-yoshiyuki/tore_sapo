<template>
  <div id="app">
    <p>{{ message }}</p>
    <dl>
      <dt @click="isOpen" class="slideHead"> 
        <p class="headText">詳しくはこちら</p>
      </dt>
      <SlideUpDown :active="isActive">
        <dd class="slideBody">
          <p>This is vue-slide-up-down!</p>
        </dd>
      </SlideUpDown>
      <dd class="slideFoot">
        <p>★★★★</p>
      </dd>
    </dl>  
  </div>
</template>

<script>
import Vue from 'vue'
import SlideUpDown from 'vue-slide-up-down'

export default Vue.extend({
  data: function () {
    return {
      message: "Hello Vue!",
      isActive: false,
    }
  },
  components: {
    SlideUpDown,
  },
  methods: {
    isOpen() {
      this.isActive = !this.isActive
    },
  }
})
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

.slideHead {
  height: 50px;
  width: 30%;
  margin-top: 30px;
  margin-left: 30px;
  background-color: #ea0069;
}
.headText {
  color: #0e0070;
  font-size: 20px;
  text-align: center;
}
.slideBody {
  height: 100px;
  width: 30%;
  margin-left: 30px;
  color: #FFFFFF;
  font-size: 20px;
  text-align: center;
  background-color: #0e0070;
}
.slideFoot {
  height: 30px;
  width: 30%;
  margin-left: 30px;
  color: #FFFFFF;
  font-size: 15px;
  text-align: center;
  background-color: #FFBBFF;
}
</style>
