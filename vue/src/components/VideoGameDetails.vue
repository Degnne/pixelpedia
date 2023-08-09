<template>
  <div id="detailsPage">
    <img class= "art" v-bind:src="videoGame.boxArt" alt="">
    <div class= "title"><h2>{{ videoGame.title }}</h2></div>
    <div class="details">
      <div class = "price">Release Price: <span>${{videoGame.releasePrice}}</span></div>
      <div class = "date">Release Date: <span>{{ videoGame.releaseDate }}</span></div>
      <div class = "description"><span>{{ videoGame.description }}</span></div>
      <div class = "publisher">Publisher: <span>{{ videoGame.publisherName }}</span></div>
      <div class = "system">Systems: 
        <span v-for="system in videoGame.systems" v-bind:key="system">{{system}}</span>
      </div>
      <div class="studio">Studios: 
        <span v-for="studio in videoGame.studios" v-bind:key="studio">{{studio}}</span>
      </div>
      <div class="genre">Genres: 
        <span v-for="genre in videoGame.genres" v-bind:key="genre">{{genre}} </span>
      </div>
    </div>
    
    <div class="edit-delete">
      <button @click="$router.push({name: 'editvideogame', params: {id: videoGame.id}})" id="edit-game">Edit</button>
      <button @click.prevent="deleteGame" id="delete-game">Delete</button>
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
  methods: {
    deleteGame() {
      this.$router.push({name: 'deletevideogame', params: {id: this.videoGame.id}});
    }
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
.title h2 {
  margin: 5px;
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
}
.system span {
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
}
.studio span{
  margin: 3px;
  padding: 3px;
  background-color: dimgray;
  border-radius: 5px;
}
.genre{
  grid-area: genre;
  display: flex;
  flex-wrap: wrap;
}
.genre span{
  margin: 3px;
  padding: 3px;
  background-color: dimgray;
  border-radius: 5px;
  height: 20px;
}
.description{
  grid-area: description;
}
.edit-delete {
  grid-area: edit-delete;
  display: flex;
  justify-content: right;
}
.edit-delete button {
  border-radius: 5px;
  border: none;
  padding: 3px;
  margin: 2px;
}
#delete-game {
  background-color: rgb(228, 59, 59);
  color: white;
}
#edit-game {
  background-color: rgb(60, 226, 60);
  color: white;
}
#edit-game:hover, #delete-game:hover {
  background-color: white;
  color: black;
  cursor: pointer;
}
#details {
  grid-area: details;
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 5px;
  grid-template-areas: "publisher price date"
                      "studio system system"
                      "genre genre genre"
                      "description description description";
}
#detailsPage{
  margin-top: 20px;
  display:grid;
  gap: 5px;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  grid-template-areas: 
  "title title title edit-delete" 
  "art art details details"
  "art art details details"
  "art art details details"
  "art art details details"
  "art art details details";
}

</style>