<template>
  <div>
    <VideoGameDetails />
    <RatingForm />
    <SteamNews />
    <VideoGameReviews />    
  </div>
</template>

<script>
import VideoGameDetails from '../components/VideoGameDetails.vue';
import VideoGameReviews from '../components/VideoGameReviews.vue';
import RatingForm from '../components/RatingForm.vue';
import SteamNews from '../components/SteamNews.vue';

export default {
  components: { 
    VideoGameDetails,
    VideoGameReviews,
    RatingForm,
    SteamNews
  }
};
</script>

<style>
</style>