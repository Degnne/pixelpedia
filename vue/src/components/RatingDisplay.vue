<template>
  <div>
      Average Ratings
      <table>
              <tr>
                  <td>Story:</td>
                  <td>
                      <RatingBar :rating="rating.story" />
                  </td>
                  <td>{{rating.story}}</td>
              </tr>
              <tr>
                  <td>Visual:</td>
                  <td>
                      <RatingBar :rating="rating.visual" />
                  </td>
                  <td>{{rating.visual}}</td>
              </tr>
              <tr>
                  <td>Audio:</td>
                  <td>
                      <RatingBar :rating="rating.audio" />
                  </td>
                  <td>{{rating.audio}}</td>
              </tr>
              <tr>
                  <td>Gameplay:</td>
                  <td>
                      <RatingBar :rating="rating.gameplay" />
                  </td>
                  <td>{{rating.gameplay}}</td>
              </tr>
              <tr>
                  <td>Difficulty:</td>
                  <td>
                      <RatingBar :rating="rating.difficulty" />
                  </td>
                  <td>{{rating.difficulty}}</td>
              </tr>
              <tr>
                  <td>Overall:</td>
                  <td>
                      <RatingBar :rating="rating.overall" :isOverall="true" />
                  </td>
                  <td>{{rating.overall}}</td>
              </tr>
          </table>
  </div>
</template>

<script>
import RatingBar from '@/components/RatingBar.vue'

export default {
    props: ['rating'],
    components: {
        RatingBar
    },
    methods: {
        
    }
}
</script>

<style>

</style>