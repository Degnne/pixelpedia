<template>
  <div id="videogamereviews">
      <h3>Reviews for {{videogame.title}}</h3>
      <ReviewCard v-for="(review, index) in reviews" :key="index" :review="review" :rating="ratingForReview(review.reviewId)" />
      <h3 id="addvideogamereview">Rate & Review</h3>
      <ReviewCard v-if="userRating" :rating="userRating" :review="userReview" />
      <ReviewForm v-if="!userRating" :show="true" :rating="userRating" :review="userReview" />
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
            videogame: {},
            rating: {
                storyRating: 2,
                visualRating: 4,
                audioRating: 3,
                gameplayRating: 6,
                difficultyRating: 7,
                overallRating: 9
            }
        }
    },
    computed: {
        reviews() {
            return this.$store.state.gameReviews;
        },
        ratings() {
            return this.$store.state.gameRatings;
        },
        userRating() {
            return this.$store.getters.getGameRatings.find(rating => {
                return rating.userId = this.$store.state.user.id;
            });
        },
        userReview() {
            return this.$store.state.gameReviews.find(review => {
                return review.userId = this.$store.state.user.id;
            });
        }
    },
    methods: {
        ratingForReview(reviewId) {
            return this.ratings.find(rating => 
                rating.reviewId === reviewId
            );
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

</style>