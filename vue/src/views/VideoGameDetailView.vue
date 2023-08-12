<template>
  <div>
    <VideoGameDetails />
    <SteamNews />
    <VideoGameReviews />    
  </div>
</template>

<script>
import VideoGameDetails from '../components/VideoGameDetails.vue';
import VideoGameReviews from '../components/VideoGameReviews.vue';
import SteamNews from '../components/SteamNews.vue';

export default {
  components: { 
    VideoGameDetails,
    VideoGameReviews,
    SteamNews
  }
};
</script>

<style>
</style>