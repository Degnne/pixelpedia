<template>
  <div>
      <form action="#" id="reviewform" @submit.prevent="review ? updateReview() : addReview()">
          <label for="reviewtitle">Review Title: </label>
          <input type="text" name="reviewtitle" id="reviewtitle"  v-model="newReview.title">
          <label for="reviewtext">Review Text: </label>
          <textarea name="reviewtext" id="reviewtext" cols="30" rows="10" v-model="newReview.text"></textarea>
          <input type="submit">
      </form>
  </div>
</template>

<script>
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
    },
    methods: {
        addReview() {
            
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