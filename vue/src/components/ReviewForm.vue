<template>
  <div>
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
            newReview: {}
        }
    },
    props: ['review'],
    created() {
        if (this.review) {
            this.newReview = this.review;
        }
        this.newReview.gameId = this.$route.params.id;
    },
    methods: {
        addReview() {
            VideoGameService.addGameReview(this.review).then(response => {
                console.log(response);
            })
        },
        updateReview() {
            
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