<template>
  <div class="videogamereview">
      <div class="review-titlearea">
          <h4>{{review.reviewTitle}}</h4>
          <div class="review-edit-delete">
            <button @click.prevent="editReview = !editReview">Edit</button>
            <button @click.prevent="deleteSelf()">Delete</button>
        </div>
      </div>
      
      <p>{{review.reviewText}}</p>
      <div class="review-username">--{{review.userId}}</div>
      <div>{{review.date}}</div>
      <div>{{numberOfComments}} Comments</div>
      <ReviewForm :show="editReview" :review="review" />
  </div>
</template>

<script>
import ReviewForm from '@/components/ReviewForm.vue'
import VideoGameService from '@/services/videogameService.js'
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
            if (this.review.comments) {
                return this.review.comments.length;
            } else {
                return 0;
            }
        }
    },
    methods: {
        deleteSelf() {
            VideoGameService.deleteReview(this.review.reviewId).then(() => {
                this.$store.dispatch('loadReviews', this.$route.params.id);
            });
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