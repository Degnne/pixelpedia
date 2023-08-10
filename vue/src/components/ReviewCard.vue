<template>
  <div class="videogamereview">
      <div class="review-titlearea">
          <h4>{{review.reviewTitle}}</h4>
          <div class="review-edit-delete">
            <button @click.prevent="editReview = !editReview">Edit</button>
            <button>Delete</button>
        </div>
      </div>
      
      <p>{{review.reviewText}}</p>
      <div class="review-username">--{{review.userId}}</div>
      <div>{{review.date}}</div>
      <div>{{numberOfComments}} Comments</div>
      <ReviewForm v-if="editReview" :review="review" />
  </div>
</template>

<script>
import ReviewForm from '@/components/ReviewForm.vue'
export default {
    components: {
        ReviewForm
    },
    name: 'review-card',
    props: ['review'],
    data() {
        return {
            editReview: false
        }
    },
    computed: {
        numberOfComments() {
            return this.review.comments.length;
        }
    }
}
</script>

<style>
.videogamereview {
    border-radius: 20px;
    background-color: rgba(119,136,153, 1);
    padding: 10px;
    margin-top: 10px;
    display: flex;
    flex-direction: column;
}
.videogamereview h4 {
    margin-top: 5px;
    margin-bottom: 0px;
}
.review-titlearea {
    display: flex;    
    border-bottom: 1px solid white;
    align-items: flex-end;
    justify-content: space-between;
}
.review-username {
    align-self: flex-end;
}
</style>