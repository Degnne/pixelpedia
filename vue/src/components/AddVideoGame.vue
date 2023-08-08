<template>
  <div>
      <h2>Add Video Game</h2>
      <form action="">
          <div>
            <label for="title">Title: </label>
            <input type="text" id="title">
          </div>
          <div>
              <label for="release-date">Release Date: </label>
              <input type="date" id="release-date">
          </div>
          <div>
              <label for="release-price">Release Price: </label>
              <input type="number" id="release-price">
          </div>
          <div>
              <label for="publisher">Publisher: </label>
              <select name="publisher" id="publisher"></select>
          </div>
          <div>
              <label for="rating">Rating: </label>
              <select name="rating" id="rating">
                  <option value="E">E</option>
                  <option value="E10">E10+</option>
                  <option value="T">T</option>
                  <option value="M">M</option>
              </select>
          </div>
          <div>
            <label for="boxart">Boxart: </label>
            <input type="text" id="boxart">
          </div>
          <div>
            <label for="genres">Genres: </label>
            <i>Insert Checkboxes Here</i>
          </div>
          <div>
            <label for="studios">Studios: </label>
            <i>Insert Checkboxes Here</i>
          </div>
          <div>
              <label for="description">Description: </label>
              <textarea name="descritption" id="description" cols="30" rows="10"></textarea>
          </div>
          <div>
              <input type="submit" name="" id="">
          </div>
      </form>
  </div>
</template>

<script>
export default {

}
</script>

<style>
form div {
    margin: 10px;
}
</style>