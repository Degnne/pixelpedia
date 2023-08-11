<template>
  <div class="comment-card">
      <div class="comment-text">{{comment.commentText}}</div>
      <div class="comment-user">--{{comment.userId}}</div>
      <div class="comment-date">{{comment.date}}</div>
  </div>
</template>

<script>
export default {
    props: ['comment']
}
</script>

<style>
.comment-card {
    border-bottom: 1px solid white;
    margin-left: 20%;
    display: flex;
    flex-direction: column;
}
.comment-user {
    align-self: flex-end;
}
.comment-date {
    font-style: italic;
    align-self: flex-end;
}
</style>