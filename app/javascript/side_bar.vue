<template>
  <ul class="list-group">
    <li class="list-group-item">
      メッセージ
    </li>
    <li class="list-group-item">
      契約トレーニー
    </li>
      <li class="list-group-item" v-on:mouseover="mouseOverAction" v-on:mouseleave="mouseLeaveAction">
        売上管理
        <SlideUpDown :active="isActive">
          <li class="list-item">売上履歴</li>
          <li class="list-item">出金申請</li>
          <li class="list-item">出金履歴</li>
        </SlideUpDown>
      </li>
      <li class="list-group-item">
        設定
      </li>
    <li class="list-group-item">
      フォロー
    </li>
    <li class="list-group-item">
      フォロワー
    </li>
    <li class="list-group-item">
      いいね
    </li>
  </ul>
</template>

<script>
import Vue from 'vue'
import SlideUpDown from 'vue-slide-up-down'

export default Vue.extend({
  el: '#subList',
  data: function () {
    return {
      isActive: false,
    }
  },
  components: {
    SlideUpDown,
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
</script>

<style scoped>
.list-item {
  padding-left: 7%;
}
</style>