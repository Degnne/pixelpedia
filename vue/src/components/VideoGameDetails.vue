<template>
  <div id="detailsPage">
    <img class= "art" v-bind:src="videoGame.boxArt" alt="">
    <div class= "title"><span>{{ videoGame.title }}</span></div>
    <div class = "price"><span>${{videoGame.releasePrice}}</span></div>
    <div class = "date"><span>{{ videoGame.releaseDate }}</span></div>
    <div class = "description"><span>{{ videoGame.description }}</span></div>
    <div class = "publisher"><span>{{ videoGame.publisherName }}</span></div>
    <div class = "system">
      <span v-for="system in videoGame.systems" v-bind:key="system">{{system}}</span>
    </div>
    <div class="studio">
      <span v-for="studio in videoGame.studios" v-bind:key="studio">{{studio}}</span>
    </div>
    <div class="genre">
      <span v-for="genre in videoGame.genres" v-bind:key="genre">{{genre}} </span>
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
  grid-area: art;
  justify-content: center;
  display: flex;
  width: 500Px;
  margin: 10px;
  border-radius: 10px;
}
.title{
  grid-area: title;
}
.date{
  grid-area: date;
  height: 30px;
  vertical-align: middle;
}
.date span{
  margin: 3px;
  padding: 3px;
  background-color: dimgray;
  border-radius: 5px;
}
.price{
  grid-area: price;
  height: 30px;
  vertical-align: middle;
}
.price span{
  margin: 3px;
  padding: 3px;
  background-color: dimgray;
  border-radius: 5px;
}
.system{
  grid-area: system;
  margin: 3px;
  padding: 3px;
  background-color: dimgray;
  border-radius: 5px;
}
.publisher{
  grid-area: publisher;
  height: 30px;
  vertical-align: middle;
}
.publisher span{
  margin: 3px;
  padding: 3px;
  background-color: dimgray;
  border-radius: 5px;
}
.studio{
  grid-area: studio;
  margin: 3px;
  padding: 3px;
  background-color: dimgray;
  border-radius: 5px;
}
.studio span{
  margin: 3px;
  padding: 3px;
  background-color: dimgray;
  border-radius: 5px;
}
.genre{
  grid-area: genre;
  height: 30px;
  vertical-align: middle;
  display: flex;
  flex-wrap: wrap;
}
.genre span{
  margin: 3px;
  padding: 3px;
  background-color: dimgray;
  border-radius: 5px;
}
.description{
  grid-area: description;
}
#detailsPage{
  display:grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-areas: 
  "title title title" 
  "art art art"
  "price publisher date"
  "genre genre genre"
  "system studio ."
  "description description description";
}

</style>