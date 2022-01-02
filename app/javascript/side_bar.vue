<template>
  <ul class="list-group">
    <a href="#" class="list-group-item">
      メッセージ
    </a>
    <a href="#" class="list-group-item">
      契約トレーニー
    </a>
      <li class="list-group-item" v-on:mouseover="mouseOverAction" v-on:mouseleave="mouseLeaveAction">
        売上管理
        <SlideUpDown :active="isActive">
          <ul class="list-group list-group-flush">
            <a href="../test/index" class="list-group-item">売上履歴</a>
            <a href="#" class="list-group-item">出金申請</a>
            <a href="#" class="list-group-item">出金履歴</a>
          </ul>
        </SlideUpDown>
      </li>
      <a href="#" class="list-group-item">
        各種設定
      </a>
    <a href="#" class="list-group-item">
      フォロー
    </a>
    <a href="#" class="list-group-item">
      フォロワー
    </a>
    <a href="#" class="list-group-item">
      いいね
    </a>
  </ul>
</template>

<script>
import Vue from 'vue'
import SlideUpDown from 'vue-slide-up-down'

export default Vue.extend({
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