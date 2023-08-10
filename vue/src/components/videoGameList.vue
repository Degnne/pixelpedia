<template>
  <div>
      <input type="text" placeholder="Search" v-model="searchTerm" class="searchbox">
    <div id="videogamelist">  
    <div v-for="videogame in filteredVideoGameList" v-bind:key="videogame.id" class="videoGameCard"><router-link  v-bind:to="{name: 'videogamedetails', params: {id: videogame.id}}"> <video-game-card v-bind:videogame="videogame"/> </router-link></div>
    </div>
  </div>
</template>

<script>
import videogameService from "../services/videogameService.js";
import VideoGameCard from './VideoGameCard.vue';
import VideoGameCardVue from './VideoGameCard.vue';

export default {
  components: { VideoGameCard },
    name: "videogamelist",
    component: {
        VideoGameCardVue,
    },
    data() {
        return{
            videoGameList: [],
            searchTerm: ''
        }
    },
    computed: {
        filteredVideoGameList: {
            get: function() {
                let filteredList = this.videoGameList;
                const searchTerm = this.searchTerm.toLowerCase();
                if (this.searchTerm !== '') {
                    filteredList = this.videoGameList.filter(videogame => {
                        return (videogame.title.toLowerCase().includes(searchTerm))
                            || (videogame.publisherName.toLowerCase().includes(searchTerm))
                            || (videogame.genres.toString().toLowerCase().includes(searchTerm))
                            || (videogame.systems.toString().toLowerCase().includes(searchTerm))
                            || (videogame.studios.toString().toLowerCase().includes(searchTerm))
                            || (videogame.releaseDate.includes(searchTerm));
                    });
                }
                
                return filteredList;
            },
            set: function() {

            }
            
        }
    },
    created(){
        videogameService.getVideoGames().then(response =>{
            this.videoGameList = response.data;
            this.filteredVideoGameList = response.data;
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
.searchbox {
    border-radius: 5px;
    border: none;
}
.videoGameCard, a {
    text-decoration: none;
    color: whitesmoke;
}
.videoGameCard{
    margin: 5px;
    padding: 5px;
    border: 1px solid grey;
    background-color: lightslategray;
    border-radius: 10px;
    position: relative;
}
#videogamelist{
    display: flex;
    flex-wrap: wrap;

}

</style>