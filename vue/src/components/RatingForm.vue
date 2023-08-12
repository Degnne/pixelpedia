<template>
  <div>
      Rate This Game.
      <form action="" class="ratingform">
          <table>
              <tr>
                  <td>Story:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.story" /></td>
                  <td>{{newRating.story}}</td>
              </tr>
              <tr>
                  <td>Visual:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.visual" /></td>
                  <td>{{newRating.visual}}</td>
              </tr>
              <tr>
                  <td>Audio:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.audio" /></td>
                  <td>{{newRating.audio}}</td>
              </tr>
              <tr>
                  <td>Gameplay:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.gameplay" /></td>
                  <td>{{newRating.gameplay}}</td>
              </tr>
              <tr>
                  <td>Difficulty:</td>
                  <td><input type="range" min="0" max="10" v-model="newRating.difficulty" /></td>
                  <td>{{newRating.difficulty}}</td>
              </tr>
              <tr>
                  <td colspan="3"><input type="submit"></td>
              </tr>
          </table>         
      </form>
  </div>
</template>

<script>

export default {
    data() {
        return {
            newRating: {
                story: 0,
                visual: 0,
                audio: 0,
                gameplay: 0,
                difficulty: 0
            }
        }
    }
}
</script>

<style>

</style>