<template>
  <div>
    
    <div><img class="boxart" v-bind:src="videogame.boxArt" alt=""></div>
  </div>
</template>

<script>
export default {
    name: "VideoGameCard",
    props: ["videogame"],

};
</script>

<style>
  .boxart{
    display: block;
    margin-left: auto;
    margin-right: auto;
    height: 175px;
    align-self: center;
    border-radius: 10px;
  }
  .title{
    
  }
  .releaseDate span{
      font-size: 80%;
  }
</style>