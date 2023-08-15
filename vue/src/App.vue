<template>
  <div id="app">
    <header>
      <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <span v-if="$store.getters.userIsAdmin"><router-link v-bind:to="{ name: 'addvideogame' }" v-if="$store.getters.userIsAdmin">Add Video Game</router-link>&nbsp;|&nbsp;</span>
      <router-link v-bind:to="{ name: 'emulatorlist' }">Emulators</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    </header>    
    <main>
      <router-view />
    </main>
    <footer></footer>
  </div>
</template>

<script>

export default {
  
}
</script>


<style>
  #app{
    margin: 0px;
    padding: 0px;
    height: 100vh;
    width: 100%;
    display: grid;
    grid-template-columns: 33% 1fr 33%;
    grid-template-rows: 50px 1fr 30px;
    grid-template-areas: 
    "Header Header Header"
    "body body body"
    "Footer Footer Footer"
    ;
    justify-items: center;
  }
  header{
    width: 100%;
    display: flex;
    justify-content: center;
    background-color: #333;
    align-items: center;
    grid-area: Header;
  }
  main{
    grid-area: body;
    padding-bottom: 50px;
  }
  body{
    padding: 0px;
    margin: 0px;
    background-color: #454545;
    color: whitesmoke;
    font-family: Arial, Helvetica, sans-serif;
  }
  a{
    color: lightblue;
    text-decoration: none;
  }
  footer {
    grid-area: Footer;
  }
  .preview-boxart {
    width: 200px;
    border-radius: 10px;
  }

  select {
    border-radius: 5px;
  }

  button {
    border-radius: 5px;
    height: 20px;
    border: none;
    margin: 2px;
    background-color: lightgray;
  }

  button:hover {
    cursor: pointer;
    background-color: white;
  }

  input, textarea {
    border-radius: 5px;
    border: none;
  }

  h3 {
    margin-top: 50px;
    border-bottom: 1px solid white;
    background: linear-gradient(to right, rgba(51, 51, 51, 1), rgba(51, 51, 51, 0));
    z-index: 1;
    position: relative;
    padding: 10px;
    left: -10px;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
    text-shadow: 1px 1px 2px black;
}
</style>
