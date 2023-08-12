<template>
  <div id="videogamereviews">
      <h3>Reviews for {{videogame.title}}</h3>
      <ReviewCard v-for="(review, index) in reviews" :key="index" :review="review" />
      <h3 id="addvideogamereview">Rate & Review</h3>
      <ReviewForm :show="true" />
  </div>
</template>

<script>
import VideoGameService from '../services/videogameService.js'
import ReviewCard from '../components/ReviewCard.vue'
import ReviewForm from '../components/ReviewForm.vue'

export default {
    components: {
        ReviewCard,
        ReviewForm
    },
    data() {
        return {
            videogame: {}
        }
    },
    computed: {
        reviews() {
            return this.$store.state.gameReviews;
        }
    },
    created() {
        VideoGameService.getVideoGameById(this.$route.params.id).then(response => {
            this.videogame = response.data;
        });
        this.$store.dispatch('loadReviews', this.$route.params.id).then(() => {
            
        });
    }
}
</script>

<style>
#videogamereviews h3 {
    margin-top: 50px;
    border-bottom: 1px solid white;
    background: linear-gradient(to right, rgba(51, 51, 51, 1), rgba(51, 51, 51, 0));
    z-index: 1;
    position: relative;
    padding: 10px;
    left: -10px;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
    text-shadow: 1px 1px 2px black;
}
</style>