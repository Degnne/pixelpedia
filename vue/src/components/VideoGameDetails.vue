<template>
  <div id="detailsPage" :style="{ 
    background: gradientBackground + '0% 0% / 200% 200% repeat',
    animation: 'Animation 20s ease infinite'
    }">
    <img class= "art" ref="boxArt" id="boxArt" v-bind:src="videoGame.boxArt" alt="">
    <div class= "title"><h2>{{ videoGame.title }}</h2></div>
    <div id="details">
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
      <div class="rating" v-if="dataLoaded">
        Rating: 
        <img :src="ratingImgUrl" :alt="videoGame.rating" :title="videoGame.rating">
      </div>
      <div class="average-ratings">
        <h4>Average Rating</h4>
        <RatingDisplay :rating="rating" />
      </div>
      <div class="videogamedetails-jumpbuttons">
        <router-link :to="{hash: '#videogamereviews'}" tag="button" @click.native="anchorHashCheck()">View Reviews</router-link>
        <router-link :to="{hash: '#addvideogamereview'}" tag="button" @click.native="anchorHashCheck()">Add Review</router-link>
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
import ColorThief from "colorthief";
import RatingDisplay from '@/components/RatingDisplay.vue'

export default {
  components: {
    RatingDisplay
  },
  data() {
    return {
      videoGame: {},
      rating: {
        storyRating: 1,
        visualRating: 10,
        audioRating: 8,
        gameplayRating: 7,
        difficultyRating: 10,
        overallRating: 8.5
      },
      palette: null,
      dataLoaded: false
    };
  },
  methods: {
    anchorHashCheck() {
      if (window.location.hash === this.$route.hash) {
        const el = document.getElementById(this.$route.hash.slice(1))
        if (el) {
          const scrollOptions = {
            top: el.offsetTop,
            behavior: 'smooth'
          };
          window.scrollTo(scrollOptions);
        }
      }
    },
    deleteGame() {
      this.$router.push({ name: 'deletevideogame', params: { id: this.videoGame.id } });
    }
  },
  computed: {
    ratingImgUrl() {
      return require(`../assets/${this.videoGame.rating}.png`);
    },
    gradientBackground() {
      if (this.palette) {
        const gradientColors = this.palette
          .map(color => `rgb(${color[0]}, ${color[1]}, ${color[2]})`)
          .join(', ');

        return `linear-gradient(to right, ${gradientColors})`;
      }

      return 'none';
    }
  },
  mounted() {
    this.$store.commit('RESET_REVIEWS_AND_COMMENTS');
    videogameService
      .getVideoGameById(this.$route.params.id)
      .then((response) => {
        this.videoGame = response.data;
        this.dataLoaded = true;

        const colorThief = new ColorThief();
        const img = new Image();

        img.addEventListener('load', () => {
          this.palette = colorThief.getPalette(img);
          //console.log(this.palette);
        });

        let imageURL = this.videoGame.boxArt;
        let googleProxyURL = 'https://images1-focus-opensocial.googleusercontent.com/gadgets/proxy?container=focus&refresh=2592000&url=';

        img.crossOrigin = 'Anonymous';
        img.src = googleProxyURL + encodeURIComponent(imageURL);
      });

      this.anchorHashCheck()
  }
};
</script>


<style>
.art{
  grid-area: art;
  justify-content: center;
  display: flex;
  width: 500Px;
  border-radius: 10px;
}
.title{
  grid-area: title;
}
.title h2 {
  margin: 5px;
  text-shadow: 1px 1px 2px black;
  font-weight: 900;
  font-size: 1.8rem;
}
.rating {
  grid-area: rating;
  display: flex;
  align-items: center;
}
.rating img {
  width: 50px;
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
  align-items: center;
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
.edit-delete {
  grid-area: edit-delete;
  display: flex;
  justify-content: right;
}
.edit-delete button {
  border-radius: 5px;
  border: 1px solid white;
  padding: 3px;
  margin: 2px;
  width: 50px;
  height: 30px;
}
.videogamedetails-jumpbuttons {
  grid-area: jump;
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
.average-ratings {
  grid-area: average-ratings;
}
#details {
  background-color: rgba(30, 30, 30, .7);
  border-radius: 20px;
  padding: 10px;
  grid-area: details;
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 20px;
  grid-template-areas: "publisher price date"
                      "studio system rating"
                      "genre genre genre"
                      "description description description"
                      "average-ratings average-ratings jump";
  align-items: center;
}
#detailsPage{
  padding: 10px;
  border-radius: 20px;
  grid-area: gradient-background;
  margin-top: 20px;
  display:grid;
  gap: 5px;
  grid-template-columns: auto auto 1fr auto;
  grid-template-areas: 
  "title title title edit-delete" 
  "art art details details"
  "art art details details"
  "art art details details"
  "art art details details"
  "art art details details";
  align-items: flex-start;
  
  /*-webkit-box-reflect: below 5px linear-gradient(to bottom, rgba(0,0,0,0.0), rgba(0,0,0,0.1)); */
}

@keyframes Animation { 
    0%{background-position:0% 0%}
    50%{background-position:100% 0%}
    100%{background-position:-0% 0%}
}

</style>