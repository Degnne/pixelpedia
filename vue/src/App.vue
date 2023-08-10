<template>
  <div id="app">
    <header>
      <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'addvideogame' }">Add Video Game</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    </header>    
    <main>
      <router-view />
    </main>
    <footer></footer>
  </div>
</template>
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
</style>
