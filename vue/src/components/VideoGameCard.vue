<template>
  <div>
    <div @mouseover="hover = true" @mouseleave="hover = false"><img class="boxart" v-bind:src="videogame.boxArt" alt=""></div>
    <div v-if="hover" @mouseover="hover = true" @mouseleave="hover = false">{{videogame.title}}</div>  
  </div>
</template>

<script>
export default {
    name: "VideoGameCard",
    props: ["videogame"],
    data(){
      return{
        hover: false,
        };
    }

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
</style>