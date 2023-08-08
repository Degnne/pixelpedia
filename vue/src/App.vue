<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'addvideogame' }">Add Video Game</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <main>
      <router-view />
    </main>
  </div>
</template>
<style>
  #app{
    display: grid;
    grid-template-columns: 33% 33% 33%;
    grid-template-areas: 
    "Header Header Header"
    "body body body"
    "Footer Footer Footer"
    ;
    justify-items: center;
  }
  #nav{
    grid-area: Header;
  }
  main{
    grid-area: body;
  }
  body{
    background-color: #454545;
    color: whitesmoke;
    font-family: Arial, Helvetica, sans-serif;
  }
  a{
    color: lightblue;
    text-decoration: none;
  }
</style>
