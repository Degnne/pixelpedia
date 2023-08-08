<template>
  <div id="detailsPage">
    <img class= "art" v-bind:src="videoGame.boxArt" alt="">
    <div class= "title">{{ videoGame.title }}</div>
    <div class = "price">${{videoGame.releasePrice}}</div>
    <div class = "date">{{ videoGame.releaseDate }}</div>
    <div class = "description">{{ videoGame.description }}</div>
    <div class = "publisher">{{ videoGame.publisherName }}</div>
    <div class = "system">
      <span v-for="system in videoGame.systems" v-bind:key="system">{{system}}</span>
    </div>
    <div class="studio">
      <span v-for="studio in videoGame.studios" v-bind:key="studio">{{studio}}</span>
    </div>
    <div class="genre">
      <span v-for="genre in videoGame.genres" v-bind:key="genre">{{genre}}</span>
    </div>
  </div>
</template>

<script>
import videogameService from "../services/videogameService";

export default {
  data() {
    return {
      videoGame: {},
    };
  },
  created() {
    videogameService
      .getVideoGameById(this.$route.params.id)
      .then((response) => {
        this.videoGame = response.data;
      });
  },
};
</script>

<style>
.art{
  border-radius: 10px;
  grid-area: art;
  justify-content: center;
}
.title{
  grid-area: title;
}
.date{
  grid-area: date;
}
.price{
  grid-area: price;
}
.description{
  grid-area: description;
}
.genre{
  grid-area: genre;
}
.system{
  grid-area: system;
}
.studio{
  grid-area: studio;
}

#detailsPage{
  display:grid;
  grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr;
  grid-template-areas: 
  "title title title title title title" 
  "art art art art art art"
  "date price publisher genre system studio"
  "description description description description description description";
}

</style>