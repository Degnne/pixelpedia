<template>
  <div class="comment-card">
      <div class="confirm-review-delete" v-if="confirmingDelete">
            <div>Are you sure you want to delete this comment?</div>
            <div>
                <button @click.prevent="deleteThis()">Yes</button>
                <button @click.prevent="confirmingDelete = false">No</button>
            </div>
        </div>
    <div class="comment-text">
        {{comment.commentText}}
    </div>
    <div class="comment-edit-delete">
        <button @click.prevent="$store.commit('TOGGLE_EDIT_COMMENTS', comment.commentId)" v-if="canEdit">Edit</button>
        <button @click.prevent="confirmingDelete = !confirmingDelete" v-if="canDelete">Delete</button>
    </div>
    <div class="comment-user">--{{commenter.username}}</div>
    <div class="comment-date">{{comment.date}}</div>
    <CommentForm v-if="$store.state.editingComments.includes(this.comment.commentId)" :comment="comment" />
  </div>
</template>

<script>
import UserService from '@/services/UserService.js'
import VideoGameService from '@/services/videogameService.js'
import CommentForm from '@/components/CommentForm.vue'

export default {
    components: {
        CommentForm
    },
    props: ['comment'],
    data() {
        return {
            commenter: {},
            confirmingDelete: false
        }
    },
    computed: {
        canEdit() {
            if (this.$store.state.user.id === this.comment.userId) {
                return true;
            }
            return false;
        },
        canDelete() {
            if (this.$store.getters.userIsAdmin) {
                return true;
            }
            if (this.$store.state.user.id === this.comment.userId) {
                return true;
            }
            return false;
        }
    },
    created() {
        UserService.getUserById(this.comment.userId).then(response => {
            this.commenter = response.data;
        })
    },
    methods: {
        deleteThis() {
            VideoGameService.deleteComment(this.comment.commentId).then(() => {
                this.$store.dispatch('loadReviews', this.$route.params.id);
            })
        }
    }
}
</script>

<style>
.comment-card {
    border: 1px solid white;
    border-radius: 10px;
    padding: 10px;
    margin: 5px;
    margin-left: 20%;
    display: flex;
    flex-direction: column;
    position: relative;
}
.comment-user {
    align-self: flex-end;
}
.comment-date {
    font-style: italic;
    align-self: flex-end;
}
.comment-edit-delete {
    position: absolute;
    top: 5px;
    right: 5px;
}
</style>