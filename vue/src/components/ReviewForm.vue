<template>
  <div v-if="show">
      <form action="#" id="reviewform" @submit.prevent="review ? updateReview() : addReview()">
          <label for="reviewtitle">Review Title: </label>
          <input type="text" name="reviewtitle" id="reviewtitle"  v-model="newReview.reviewTitle">
          <label for="reviewtext">Review Text: </label>
          <textarea name="reviewtext" id="reviewtext" cols="30" rows="10" v-model="newReview.reviewText"></textarea>
          <input type="submit">
      </form>
  </div>
</template>

<script>
import VideoGameService from '@/services/videogameService.js'

export default {
    data() {
        return {
            newReview: {},
            showSelf: true
        }
    },
    props: ['review', 'show'],
    created() {
        this.showSelf = this.show;
        if (this.review) {
            this.newReview = this.review;
        }
        this.newReview.gameId = this.$route.params.id;
        this.newReview.userId = this.$store.state.user.id;
    },
    methods: {
        addReview() {
            this.newReview.date = Date.now;
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
                this.showSelf = false;
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