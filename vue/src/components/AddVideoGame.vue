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
              <select name="publisher" id="publisher" v-model="newVideoGame.publisherName"></select>
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
            <i>Insert Checkboxes Here</i>
          </div>
          <div>
            <label for="studios">Studios: </label>
            <i>Insert Checkboxes Here</i>
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
            newVideoGame: {}
        }
    },
    methods: {
        addNewVideoGame() {
            VideoGameService.addVideoGame(this.newVideoGame);
            this.newVideoGame = {};
        }
    }
}
</script>

<style>
form div {
    margin: 10px;
}
</style>