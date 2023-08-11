<template>
    <div class="videogamereview-container">
        <div class="videogamereview">
            <div class="review-titlearea">
                <h4>{{review.reviewTitle}}</h4>
                <div class="review-edit-delete">
                    <button @click.prevent="editReview()">Edit</button>
                    <button @click.prevent="deleteSelf()">Delete</button>
                </div>
            </div>
            
            <p>{{review.reviewText}}</p>
            <div class="review-username">--{{reviewer.username}}</div>
            <div class="review-date">Reviewed {{review.date}}</div>
            <ReviewForm v-if="$store.state.editingReview.includes(review.reviewId)" :review="review" />            
        </div>
        <div class="number-of-comments" @click="viewComments()">{{numberOfComments}} {{numberOfComments === 1 ? 'Comment' : 'Comments'}}</div>
        <ReviewComments v-if="$store.state.viewingComments.includes(review.reviewId)" :comments="review.comments" :reviewId="review.reviewId" />
    </div>
</template>

<script>
import ReviewForm from '@/components/ReviewForm.vue'
import ReviewComments from '@/components/ReviewComments.vue'
import VideoGameService from '@/services/videogameService.js'
import UserService from '@/services/UserService.js'
export default {
    components: {
        ReviewForm,
        ReviewComments
    },
    name: 'review-card',
    props: ['review'],
    data() {
        return {
            reviewer: {}
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
        viewComments() {
            this.$store.commit('TOGGLE_VIEW_COMMENTS', this.review.reviewId);
        },
        editReview() {
            this.$store.commit('TOGGLE_EDIT_REVIEW', this.review.reviewId);
        },
        deleteSelf() {
            VideoGameService.deleteReview(this.review.reviewId).then(() => {
                this.$store.dispatch('loadReviews', this.$route.params.id);
            });
        }        
    },
    created() {
        UserService.getUserById(this.review.userId).then(response => {
            this.reviewer = response.data;
        });
    }
}
</script>

<style>
.review-date {
    font-style: italic;
    align-self: flex-end;
}
.videogamereview-container {
    display: flex;
    flex-direction: column;
}
.number-of-comments {
    cursor: pointer;
    background-color: #333;
    border-radius: 10px;
    padding: 5px;
    width: 100px;
    align-self: flex-end;
    border: 1px solid #333;
    text-align: center;
    margin-top: 5px;
}
.number-of-comments:hover {
    border: 1px solid white;
}
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