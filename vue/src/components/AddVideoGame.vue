<template>
  <div>
      <h2>Add Video Game</h2>
      <form action="#" @submit.prevent="addNewVideoGame()" id="game-form">
          <div id="title-div">
            <label for="title">Title: </label>
            <input type="text" id="title" v-model="newVideoGame.title" required>
          </div>
          <div id="release-date-div">
              <label for="release-date">Release Date: </label>
              <input type="date" id="release-date" v-model="newVideoGame.releaseDate" required>
          </div>
          <div id="release-price-div">
              <label for="release-price">Release Price: </label>
              <input type="number" id="release-price" v-model="newVideoGame.releasePrice" required>
          </div>
          <div id="publisher-div">
              <label for="publisher">Publisher: </label>
              <select name="publisher" id="publisher" v-model="newVideoGame.publisherName" required>
                  <option v-for="publisher in companies" :key="publisher" :value="publisher">{{publisher}}</option>
              </select>
          </div>
          <div id="rating-div">
              <label for="rating">Rating: </label>
              <select name="rating" id="rating" v-model="newVideoGame.rating" required>
                  <option value="E">E</option>
                  <option value="E10">E10+</option>
                  <option value="T">T</option>
                  <option value="M">M</option>
              </select>
          </div>
          <div id="boxart-div">
            <label for="boxart">Boxart: </label>
            <input type="text" id="boxart" v-model="newVideoGame.boxArt">
          </div>
          <div id="genres-div">
            <label for="genres">Genres: </label>
            <div v-for="genre in genres" :key="genre" required>
                <input type="checkbox" :value="genre" :name="genre" :id="genre" @change="toggleGenre(genre)">
                <label :for="genre">{{genre}}</label>
            </div>
          </div>
          <div id="studios-div">
            <label for="studios">Studios: </label>
            <div v-for="studio in companies" :key="studio" required>
                <input type="checkbox" :value="studio" :name="studio" :id="studio" @change="toggleStudio(studio)">
                <label :for="studio">{{studio}}</label>
            </div>
        </div>
        <div id="systems-div">
            <label for="systems">Systems: </label>
            <div v-for="system in systems" :key="system" required>
                <input type="checkbox" :value="system" :name="system" :id="system" @change="toggleSystem(system)">
                <label :for="system">{{system}}</label>
            </div>
          </div>
          <div id="description-div">
              <label for="description">Description: </label>
              <textarea name="descritption" id="description" cols="100" rows="10" v-model="newVideoGame.description"></textarea>
          </div>
          <div id="submit-div">
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
#game-form {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-areas: "title release-date release-price"
                        "publisher rating boxart"
                        "genres studios systems"
                        "description description description"
                        "submit submit submit";
}
#title-div {
    grid-area: title;
}
#release-date-div {
    grid-area: release-date;
}
#release-price-div {
    grid-area: release-price;
}
#publisher-div {
    grid-area: publisher;
}
#rating-div {
    grid-area: rating;
}
#boxart-div {
    grid-area: boxart;
}
#studios-div {
    grid-area: studios;
}
#systems-div {
    grid-area: systems;
}
#title-div {
    grid-area: title;
}
#description-div {
    grid-area: description;
    display: flex;
    flex-direction: column;
}
#submit-div {
    grid-area: submit;
}
#submit-div input {
    width: 100%;
    height: 20px;
    background-color: lightgreen;
    border-radius: 5px;
    border: none;
}
#submit-div input:hover {
    background-color: white;
    cursor: pointer;
}
form div {
    margin: 10px;
}
</style>