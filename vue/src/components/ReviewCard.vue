<template>
    <div class="videogamereview-container">
        
        <div class="confirm-review-delete" v-if="confirmingDelete">
            <div>Are you sure you want to delete this review?</div>
            <div>
                <button @click.prevent="deleteSelf()">Yes</button>
                <button @click.prevent="confirmingDelete = false">No</button>
            </div>
        </div>
        
        <div class="videogamereview">
            <div class="review-titlearea">
                <h4>{{review ? review.reviewTitle : 'Rating'}}</h4>
                <div class="review-edit-delete">
                    <button @click.prevent="editReview()">Edit</button>
                    <button @click.prevent="confirmingDelete = !confirmingDelete">Delete</button>
                </div>
            </div>
            <div class="rating-and-review">
                <RatingDisplay v-if="rating" :rating="rating" />
                <p class="review-text" v-if="review">{{review.reviewText}}</p>
            </div>
            
            <div class="review-username" v-if="this.reviewer">--{{reviewer.username}}</div>
            <div class="review-date" v-if="review">Reviewed {{review.date}}</div>
            <div>
                <ReviewForm v-if="editing" :review="review" :rating="rating" /> 
            </div>
                       
        </div>
        
        <div v-if="review">
            <div class="number-of-comments" @click="viewComments()">{{numberOfComments}} {{numberOfComments === 1 ? 'Comment' : 'Comments'}}</div>
            <ReviewComments v-if="$store.state.viewingComments.includes(review.reviewId)" :comments="review.comments" :reviewId="review.reviewId" />
        </div>
        
    </div>
</template>

<script>
import RatingDisplay from '@/components/RatingDisplay.vue'
import ReviewForm from '@/components/ReviewForm.vue'
import ReviewComments from '@/components/ReviewComments.vue'
import VideoGameService from '@/services/videogameService.js'
import UserService from '@/services/UserService.js'
export default {
    components: {
        ReviewForm,
        ReviewComments,
        RatingDisplay
    },
    name: 'review-card',
    props: ['review'],
    data() {
        return {
            reviewer: {},
            confirmingDelete: false,
            rating: {}
        }
    },
    computed: {
        numberOfComments() {
            if (this.review) {
                if (this.review.comments) {
                    return this.review.comments.length;
                } else {
                    return 0;
                }
            }
            return 0;
        },
        editing() {
            if (this.review) {
                return this.$store.state.editingReview.includes(this.review.reviewId);
            }
            return this.$store.state.editingRating;
        }
    },
    methods: {
        viewComments() {
            this.$store.commit('TOGGLE_VIEW_COMMENTS', this.review.reviewId);
        },
        editReview() {
            if(this.review) {
                this.$store.commit('TOGGLE_EDIT_REVIEW', this.review.reviewId);
            } else {
                this.$store.commit('TOGGLE_EDIT_RATING');
            }
        },
        deleteSelf() {
            this.confirmingDelete = false;
            if (this.rating) {
                VideoGameService.deleteRating(this.rating.ratingId).then(() => {
                    if (this.review) {
                        VideoGameService.deleteReview(this.review.reviewId).then(() => {
                            this.$store.dispatch('loadReviews', this.$route.params.id);
                        });
                    } else {
                        this.$store.dispatch('loadReviews', this.$route.params.id);
                    }                 
                });   
            } else {
                VideoGameService.deleteReview(this.review.reviewId).then(() => {
                    this.$store.dispatch('loadReviews', this.$route.params.id);
                });
            }
                     
        }      
    },
    created() {
        if (this.review) {
            UserService.getUserById(this.review.userId).then(response => {
                this.reviewer = response.data;
            });
        } else if (this.rating) {
            UserService.getUserById(this.rating.userId).then(response => {
                this.reviewer = response.data;
            });
        }
        
        this.rating = this.$store.getters.getRatingForReview(this.review.reviewId);
       
        
    }
}
</script>

<style>
.confirm-review-delete {
    position: absolute;
    padding: 20px;
    border-radius: 5px;
    z-index: 1;
    align-self: center;
    justify-self: center;
    background-color: rgba(50, 50, 50, .7);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
.review-date {
    font-style: italic;
    align-self: flex-end;
}
.videogamereview-container {
    display: flex;
    flex-direction: column;
    position: relative;
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

.videogamereview-container .ratingbar-container {
    border: 1px solid white;
}

.videogamereview-container .rating-and-review {
    display: flex;
    justify-content:left;
}

.review-text {
    margin-left: 50px;
}
</style>