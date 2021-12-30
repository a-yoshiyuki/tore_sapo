<template>
  <div id= "SideBar" >
    <ul class="list-group">
      <li class="list-group-item">
        メッセージ
      </li>
      <li class="list-group-item">
        契約トレーニー
      </li>
      <li class="list-group-item" v-on:mouseover="mouseOverAction">
        {{message}}
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
    <p>これはVue.jsか表示されています</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "売上管理",
    }
  },
  methods: {
    mouseOverAction: function () {
      this.message = "成功!";
    }
  }
};


//new Vue({
  //el: "#SideBar",
  //data: {
        //message: "売上管理"
    //},
  
  //methods: {
    //mouseOverAction(){
      //this.SubList = true
    //},
    //mouseLeaveAction(){
      //this.SubList = false
    //}
  //}
//});
</script>