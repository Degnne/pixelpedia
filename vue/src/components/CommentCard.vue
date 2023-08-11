<template>
  <div class="comment-card">
    <div class="comment-text">
        {{comment.commentText}}
    </div>
    <div class="comment-edit-delete">
        <button>Edit</button>
        <button>Delete</button>
    </div>
    <div class="comment-user">--{{commenter.username}}</div>
    <div class="comment-date">{{comment.date}}</div>
  </div>
</template>

<script>
import UserService from '@/services/UserService.js'

export default {
    props: ['comment'],
    data() {
        return {
            commenter: {}
        }
    },
    created() {
        UserService.getUserById(this.comment.userId).then(response => {
            this.commenter = response.data;
        })
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