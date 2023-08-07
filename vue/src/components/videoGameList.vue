<template>
  <div>
  <h2> video game list </h2>  
  <div v-for="videogame in videoGameList" v-bind:key="videogame.id" class="videoGameCard"><router-link  v-bind:to="{name: 'videogamedetails', params: {id: videogame.id}}"> <video-game-card v-bind:videogame="videogame"/> </router-link></div>
  </div>
</template>

<script>
import videogameService from "../services/videogameService.js";
import VideoGameCard from './VideoGameCard.vue';
import VideoGameCardVue from './VideoGameCard.vue';

export default {
  components: { VideoGameCard },
    name: "videogameService",
    component: {
        VideoGameCardVue,
    },
    data() {
        return{
            videoGameList: []
    
        }
    },
    created(){
        videogameService.getVideoGames().then(response =>{
            this.videoGameList = response.data;
        }).catch(error => {
            if(error.response){
                console.log(error);
            }
            else if(error.request){
                console.log(error);
            }
            else{
                console.log(error);
            }
        })    
    }

}
</script>

<style scoped>
.videoGameCard, a {
    text-decoration: none;
    color: black;
    border: 1px solid grey;
}

</style>