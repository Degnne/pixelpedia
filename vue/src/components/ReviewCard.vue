<template>
  <div class="videogamereview">
      <h4>{{review.title}}</h4>
      <p>{{review.text}}</p>
  </div>
</template>

<script>
export default {
    name: 'review-card',
    props: ['review']
}
</script>

<style>

</style>