<template>
  <div>
    <div @mouseover="hover = true" @mouseleave="hover = false"><img class="boxart" v-bind:src="videogame.boxArt" alt=""></div>
      <div v-if="hover" @mouseover="hover = true" @mouseleave="hover = false" class="boxart-details">
        <div class="boxart-details-text">{{videogame.title}}</div>      
      </div> 
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

  .boxart-details {
    margin: 0px;
    height: 20%;
    width: 100%;
    position: absolute;
    vertical-align: bottom;
    bottom: 0px;
    top: auto;
    left: 0px;
    background-image: linear-gradient( rgba(119,136,153, 0), rgba(119,136,153, 1));
    border-radius: 10px;
  }

  .boxart-details-text {
    position: absolute;
    vertical-align: bottom;
    bottom: 0px;
  }
</style>