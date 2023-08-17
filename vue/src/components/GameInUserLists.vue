<template>
  <div class="gameinuserlist">
      <div class="lists">
          <span v-if="listsGameIsIn.includes('Played')">Played
              <button v-if="isCurrentUser" @click.prevent="removeGameFromList('Played')">X</button>
            </span> 
          <span v-if="listsGameIsIn.includes('Currently')">Currently Playing
              <button v-if="isCurrentUser" @click.prevent="removeGameFromList('Currently')">X</button>
            </span>
          <span v-if="listsGameIsIn.includes('Wishlist')">Wishlist
              <button v-if="isCurrentUser"  @click.prevent="removeGameFromList('Wishlist')">X</button>
            </span>
          <span v-if="listsGameIsIn.includes('Custom')">Custom List
              <button v-if="isCurrentUser" @click.prevent="removeGameFromList('Custom')">X</button>
            </span>
      </div>
      <div v-if="isCurrentUser">
          Add to List: 
          <select name="" id="" v-model="listNameToAdd">
              <option value="Played" v-if="!listsGameIsIn.includes('Played')">Played</option>
              <option value="Currently" v-if="!listsGameIsIn.includes('Currently')">Currently Playing</option>
              <option value="Wishlist" v-if="!listsGameIsIn.includes('Wishlist')">Wishlist</option>
              <option value="Custom" v-if="!listsGameIsIn.includes('Custom')">Custom List</option>
          </select>
          <button @click.prevent="addGameToList()">Add</button>
      </div>
  </div>
</template>

<script>
import UserService from '@/services/UserService.js'
export default {
    props: ['gameId', 'userId'],
    data() {
        return {
            lists: [],
            listNameToAdd: ''
        }
    },
    computed: {
        isCurrentUser() {
            return this.userId === this.$store.state.user.id
        },
        listsGameIsIn() {
            const listNames = [];
            this.lists.forEach(list => {
                list.videoGameArray.find(game => {
                    if (game.id === this.$route.params.id) {
                        listNames.push(list.listName);
                    }
                })
            });
            return listNames;
        }
    },
    methods: {
        addGameToList() {
            console.log(this.listNameToAdd);
        },
        removeGameFromList(listName) {
            console.log(listName);
        },
    },
    created() {
        UserService.getListsForUser(this.$store.state.user.id).then(response => {
            this.lists = response.data;
        });
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