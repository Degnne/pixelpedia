<template>
  <div>
    <h4>{{videogame.title}}</h4>
    <div>Release Date: {{videogame.releaseDate}}</div>
    <div>Price: ${{videogame.releasePrice}}</div>
    <div><img src="" alt=""></div>
  </div>
</template>

<script>
export default {
    name: "VideoGameCard",
    props: ["videogame"],

};
</script>

<style>
</style>