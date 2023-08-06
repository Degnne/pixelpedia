<template>
  <div>
  <h2> video game list </h2>  
  <div v-for="videogame in videoGameList" v-bind:key="videogame.id"> {{videogame.title}} </div>
  </div>
</template>

<script>
import videogameService from "../services/videogameService.js";
export default {
    name: "videogameService",
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

<style>

</style>