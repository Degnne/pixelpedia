<template>
  <div>
      <form action="#" id="reviewform" @submit.prevent="review ? updateReview() : addReview()">
          <div>
          <table>
              <tr>
                  <td>Story:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.story" /></td>
                  <td>{{newRating.story}}</td>
              </tr>
              <tr>
                  <td>Visual:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.visual" /></td>
                  <td>{{newRating.visual}}</td>
              </tr>
              <tr>
                  <td>Audio:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.audio" /></td>
                  <td>{{newRating.audio}}</td>
              </tr>
              <tr>
                  <td>Gameplay:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.gameplay" /></td>
                  <td>{{newRating.gameplay}}</td>
              </tr>
              <tr>
                  <td>Difficulty:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.difficulty" /></td>
                  <td>{{newRating.difficulty}}</td>
              </tr>
              <tr>
                  <td>Overall:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.overall" /></td>
                  <td>{{newRating.overall}}</td>
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
        addReview() {
            this.newReview.gameId = this.$route.params.id;
            this.newReview.userId = this.$store.state.user.id;
            VideoGameService.addGameReview(this.newReview).then(() => {
                this.$store.dispatch('loadReviews', this.$route.params.id);
                this.newReview = {};
            }).catch(error => {
                console.error(error);
            });
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