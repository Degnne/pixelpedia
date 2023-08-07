<template>
<div>
    <h2>Details</h2>
    <div>{{videoGame.title}}</div>
    <div>{{videoGame.releasePrice}}</div>
    <div>{{videoGame.releaseDate}}</div>
    <div>{{videoGame.description}}</div>
    <div>{{videoGame.publisherName}}</div>
</div>
</template>

<script>
import videogameService from '../services/videogameService'

export default {
    data(){
        return{
            videoGame: {},
        }
    },
    created(){
        videogameService.getVideoGameById(this.$route.params.id).then( response => {
            this.videoGame = response.data;
        });
    }

}
</script>

<style>

</style>