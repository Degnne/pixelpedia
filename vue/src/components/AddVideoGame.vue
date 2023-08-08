<template>
  <div>
      <h2>Add Video Game</h2>
      <form action="#" @submit.prevent="addNewVideoGame()">
          <div>
            <label for="title">Title: </label>
            <input type="text" id="title" v-model="newVideoGame.title">
          </div>
          <div>
              <label for="release-date">Release Date: </label>
              <input type="date" id="release-date" v-model="newVideoGame.releaseDate">
          </div>
          <div>
              <label for="release-price">Release Price: </label>
              <input type="number" id="release-price" v-model="newVideoGame.releasePrice">
          </div>
          <div>
              <label for="publisher">Publisher: </label>
              <select name="publisher" id="publisher" v-model="newVideoGame.publisherName">
                  <option v-for="publisher in companies" :key="publisher" :value="publisher">{{publisher}}</option>
              </select>
          </div>
          <div>
              <label for="rating">Rating: </label>
              <select name="rating" id="rating" v-model="newVideoGame.rating">
                  <option value="E">E</option>
                  <option value="E10">E10+</option>
                  <option value="T">T</option>
                  <option value="M">M</option>
              </select>
          </div>
          <div>
            <label for="boxart">Boxart: </label>
            <input type="text" id="boxart" v-model="newVideoGame.boxArt">
          </div>
          <div>
            <label for="genres">Genres: </label>
            <div v-for="genre in genres" :key="genre">
                <input type="checkbox" :value="genre" :name="genre" :id="genre" @change="toggleGenre(genre)">
                <label :for="genre">{{genre}}</label>
            </div>
          </div>
          <div>
            <label for="studios">Studios: </label>
            <div v-for="studio in companies" :key="studio">
                <input type="checkbox" :value="studio" :name="studio" :id="studio" @change="toggleStudio(studio)">
                <label :for="studio">{{studio}}</label>
            </div>
            </div>
            <div>
            <label for="systems">Systems: </label>
            <div v-for="system in systems" :key="system">
                <input type="checkbox" :value="system" :name="system" :id="system" @change="toggleSystem(system)">
                <label :for="system">{{system}}</label>
            </div>
          </div>
          <div>
              <label for="description">Description: </label>
              <textarea name="descritption" id="description" cols="30" rows="10" v-model="newVideoGame.description"></textarea>
          </div>
          <div>
              <input type="submit" name="" id="">
          </div>
      </form>
  </div>
</template>

<script>
import VideoGameService from '@/services/videogameService.js'

export default {
    data() {
        return {
            newVideoGame: {},
            genres: [],
            companies: [],
            systems: []
        }
    },
    methods: {
        createNewVideoGame() {
            return {genres: [], studios: [], systems: []}
        },
        addNewVideoGame() {
            VideoGameService.addVideoGame(this.newVideoGame);
            this.newVideoGame = this.createNewVideoGame();
            this.$router.push({name: 'home'});
        },
        toggleGenre(genre) {
            if (this.newVideoGame.genres.includes(genre)) {
                this.newVideoGame.genres.splice(this.newVideoGame.genres.indexOf(genre) , 1);
            } else {
                this.newVideoGame.genres.push(genre);
            }
        },
        toggleStudio(studio) {
            if (this.newVideoGame.studios.includes(studio)) {
                this.newVideoGame.studios.splice(this.newVideoGame.studios.indexOf(studio), 1);
            } else {
                this.newVideoGame.studios.push(studio);
            }
        },
        toggleSystem(system) {
            if (this.newVideoGame.systems.includes(system)) {
                this.newVideoGame.systems.splice(this.newVideoGame.systems.indexOf(system), 1);
            } else {
                this.newVideoGame.systems.push(system);
            }
        }
    },
    created() {
        this.newVideoGame = this.createNewVideoGame();
        VideoGameService.getGenres().then(response => {
            this.genres = response.data;
        });
        VideoGameService.getSystems().then(response => {
            this.systems = response.data;
        });
        VideoGameService.getCompanies().then(response => {
            this.companies = response.data;
        });
    }
}
</script>

<style>
form div {
    margin: 10px;
}
</style>