import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import SlideUpDown from 'vue-slide-up-down'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  const el = document.getElementById('sidebar');
  if (!el) {
    return;
  }
  
  Vue.component('vue-slide-up-down', SlideUpDown);
  const app = new Vue({
    el: '#sidebar',
    data: function() {
      return {
        isActive: false,
      }
    },
    components: {
      App
    },
    methods: {
      isOpen() {
        this.isActive = !this.isActive
      }
    },
  })
})
