<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
};

new Vue({
	el:"#app",
  data:{
  	listlabel:["メッセージ", "契約トレーニー", "売上管理","設定","フォローリスト", "フォロワーリスト", "いいね数"],
    sublistlabel:["Cloth","Pants","Shoes","Goods"],
    active:""
  },
  methods:{
  	dropdown(list){
    console.log(this.active);
    	this.active = this.active===list ? "":list;
    }
  }
});
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
