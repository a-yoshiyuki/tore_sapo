<template>
  <div id= "SideBar" >
    {{ listItem }}
  </div>
</template>

<script>
export default {
  name: 'SideBar',
  data() {
    return {
      listItem: "メッセージ"
    }
  },
};
</script>