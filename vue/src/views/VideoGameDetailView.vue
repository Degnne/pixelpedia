<template>
  <div>
    <VideoGameDetails />
    <VideoGameReviews />
  </div>
</template>

<script>
import VideoGameDetails from '../components/VideoGameDetails.vue';
import VideoGameReviews from '../components/VideoGameReviews.vue';

export default {
  components: { 
    VideoGameDetails ,
    VideoGameReviews
  }
};
</script>

<style>
</style>