<template>
  <div>
      <form action="" class="comment-form">
          <textarea name="" id="" cols="50" rows="10"></textarea>
          <input type="submit">
      </form>
  </div>
</template>

<script>
export default {
    data() {
        return {
            newComment: {}
        }
    },
    created() {
        this.newComment.userId = this.$store.state.user.id;
        this.newComment.date = Date.now().toString();
    }
}
</script>

<style>
.comment-form {
    display: flex;
    flex-direction: column;
}
</style>