<template>
  <div>
    <h4>{{videogame.title}}</h4>
    <div>Release Date: {{videogame.releaseDate}}</div>
    <div>Price: ${{videogame.releasePrice}}</div>
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
  }
</style>