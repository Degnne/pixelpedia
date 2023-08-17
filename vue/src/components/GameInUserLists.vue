<template>
  <div class="gameinuserlist">
      <div class="lists">
          <span>Played<button v-if="isCurrentUser">X</button></span> 
          <span>Currently Playing</span>
          <span>Wishlist</span>
          <span>Custom List</span>
      </div>
      <div v-if="isCurrentUser">
          Add to List: 
          <select name="" id="">
              <option value="Played">Played</option>
              <option value="Currently">Currently Playing</option>
              <option value="Wishlist">Wishlist</option>
              <option value="Custom">Custom List</option>
          </select>
          <button>Add</button>
      </div>
  </div>
</template>

<script>
export default {
    props: ['gameId', 'userId'],
    data() {
        return {
            lists: []
        }
    },
    computed: {
        isCurrentUser() {
            return this.userId === this.$store.state.user.id
        }
    }
}
</script>

<style>
.gameinuserlist {
    width: 100%;
    display: flex;
    justify-content: space-between;
}

.gameinuserlist .lists span {
    background-color: Gray;
    border-radius: 5px;
    margin: 5px;
    padding: 2px;
}

</style>