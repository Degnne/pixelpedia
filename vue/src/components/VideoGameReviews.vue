<template>
  <div id="videogamereviews">
      <h3>Reviews for {{videogame.title}}</h3>
      <ReviewCard v-for="(review, index) in reviews" :key="index" :review="review" />
      <h3 id="addvideogamereview">Add a Review</h3>
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
}
</style>