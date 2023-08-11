<template>
  <div class="review-comments">
      <CommentCard v-for="comment in comments" :key="`comment-${comment.commentId}`" :comment="comment" />
      <div v-if="comments.length === 0">There are no comments.</div>
      <div class="add-comment"><button @click.prevent="addComment()">Add Comment</button></div>
  </div>
</template>

<script>
import CommentCard from '@/components/CommentCard.vue'

export default {
    props: ['comments'],
    components: {
        CommentCard
    },
    methods: {
        addComment() {
            //this.$store.commit()
        }
    }
}
</script>

<style>
.review-comments {
    display: flex;
    flex-direction: column;
}
.add-comment {
    align-self: flex-end;
}
</style>