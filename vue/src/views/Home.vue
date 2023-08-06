<template>
  <div class="home">
    <h1>Home</h1>
    <video-game-list-vue/>
  </div>
</template>

<script>
import videoGameListVue from '../components/videoGameList.vue';
export default {
  name: "home",
  components:{
    videoGameListVue
  }
};
</script>
