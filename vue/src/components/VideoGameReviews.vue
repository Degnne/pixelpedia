<template>
  <div>
      <h3>Reviews for {{videogame.title}}</h3>
      <ReviewCard v-for="(review, index) in reviews" :key="index" :review="review" /> 
  </div>
</template>

<script>
import VideoGameService from '../services/videogameService.js'
import ReviewCard from '../components/ReviewCard.vue'

export default {
    components: {
        ReviewCard
    },
    data() {
        return {
            videogame: {},
            reviews: [
                {
                    title: 'This is great!',
                    text: 'I hated this.'
                },
                {
                    title: 'Worst Game Ever!',
                    text: "I couldn't stop playing it."
                }
            ]
        }
    },
    created() {
        VideoGameService.getVideoGameById(this.$route.params.id).then(response => {
            this.videogame = response.data;
        });
    }
}
</script>

<style>

</style>