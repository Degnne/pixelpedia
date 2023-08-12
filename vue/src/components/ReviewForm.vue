<template>
  <div>
      <form action="#" id="reviewform" @submit.prevent="review ? updateReview() : addRating()">
          <div>
          <table>
              <tr>
                  <td>Story:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.storyRating" /></td>
                  <td>{{newRating.storyRating}}</td>
              </tr>
              <tr>
                  <td>Visual:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.visualRating" /></td>
                  <td>{{newRating.visualRating}}</td>
              </tr>
              <tr>
                  <td>Audio:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.audioRating" /></td>
                  <td>{{newRating.audioRating}}</td>
              </tr>
              <tr>
                  <td>Gameplay:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.gameplayRating" /></td>
                  <td>{{newRating.gameplayRating}}</td>
              </tr>
              <tr>
                  <td>Difficulty:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.difficultyRating" /></td>
                  <td>{{newRating.difficultyRating}}</td>
              </tr>
              <tr>
                  <td>Overall:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.overallRating" /></td>
                  <td>{{newRating.overallRating}}</td>
              </tr>
          </table>         
  </div>
        <button @click.prevent="plusReview = !plusReview">Add a Review</button>
        <div v-if="plusReview">
          <label for="reviewtitle">Review Title: </label>
          <input type="text" name="reviewtitle" id="reviewtitle"  v-model="newReview.reviewTitle" required />
          <label for="reviewtext">Review Text: </label>
          <textarea name="reviewtext" id="reviewtext" cols="30" rows="10" v-model="newReview.reviewText"></textarea>
          </div>
          <input type="submit">
      </form>
  </div>
</template>

<script>
import VideoGameService from '@/services/videogameService.js'

export default {
    data() {
        return {
            newRating: {},
            newReview: {},
            showSelf: true,
            plusReview: false
        }
    },
    props: ['review'],
    created() {
        this.showSelf = this.show;
        if (this.review) {
            this.newReview = this.review;
        }
        
    },
    methods: {
        addRating() {
            this.newRating.gameId = this.$route.params.id;
            this.newRating.userId = this.$store.state.user.id;
            if (this.plusReview) {
                this.newReview.gameId = this.$route.params.id;
                this.newReview.userId = this.$store.state.user.id;
                VideoGameService.addGameReview(this.newReview).then((response) => {
                    this.newRating.reviewId = response.data.reviewId;
                    VideoGameService.addRating(this.newRating);
                    this.$store.dispatch('loadReviews', this.$route.params.id);
                    this.newReview = {};
                    return response;
                }).catch(error => {
                    console.error(error);
                });
            } else {
                VideoGameService.addRating(this.newRating);
            }
        },
        async addReview() {
            
        },
        updateReview() {
            VideoGameService.editGameReview(this.newReview).then(() => {
                this.$store.dispatch('loadReviews', this.$route.params.id);
                this.$store.commit('TOGGLE_EDIT_REVIEW', this.review.reviewId);
            });
        }
    }
}
</script>

<style>
#reviewform {
    display: flex;
    flex-direction: column;
}
#reviewform label {
    margin-top: 10px;
}
</style>