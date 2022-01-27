import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import Vuetify from "vuetify"
import "vuetify/dist/vuetify.min.css"
import SlideUpDown from 'vue-slide-up-down'

Vue.use(TurbolinksAdapter)
Vue.use(Vuetify)

const vuetify = new Vuetify()

document.addEventListener('turbolinks:load', () => {
  Vue.component('vue-slide-up-down', SlideUpDown);
  const app = new Vue({
    vuetify,
    el: '#sidebar',
    data: () => {
      return {
        isActive: false,
      }
    },
    components: {
      App
    },
    methods: {
      mouseOverAction: function () {
        this.isActive = true;
      },
      mouseLeaveAction: function () {
        this.isActive = false;
      }
    }
  })
})
