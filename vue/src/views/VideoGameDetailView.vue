<template>
  <div>
    <VideoGameDetails />
    <SteamDetails />
    <VideoGameReviews />    
  </div>
</template>

<script>
import VideoGameDetails from '../components/VideoGameDetails.vue';
import VideoGameReviews from '../components/VideoGameReviews.vue';
import SteamDetails from '../components/SteamDetails.vue';

export default {
  components: { 
    VideoGameDetails,
    VideoGameReviews,
    SteamDetails
  }
};
</script>

<style>
</style>