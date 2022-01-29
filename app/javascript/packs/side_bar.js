import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import Vuetify from "vuetify"
import "vuetify/dist/vuetify.min.css"
import '@mdi/font/css/materialdesignicons.css'
import SlideUpDown from 'vue-slide-up-down'

Vue.use(TurbolinksAdapter)
Vue.use(Vuetify)

const vuetify = new Vuetify()

document.addEventListener('turbolinks:load', () => {
  const el = document.getElementById('sidebar');
  if (!el) {
    return;
  }
  
  Vue.component('vue-slide-up-down', SlideUpDown);
  const app = new Vue({
    vuetify,
    el: '#sidebar',
    data: () => ({
      items: [
        {
          icon: 'mdi-shield-account',
          text: 'HOME',
        },
        {
          icon: 'mdi-email-open',
          text: 'メッセージ',
        },
        {
          icon: 'mdi-handshake-outline',
          text: '契約トレーニー',
        },
        {
          icon: 'mdi-currency-usd',
          text: '売上管理',
        },
        {
          icon: 'mdi-tools',
          text: '各種設定',
        },
      ],
      model: 1,
    }),
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
