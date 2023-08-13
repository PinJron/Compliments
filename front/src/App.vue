<template>
    <div class="app">
      <router-view></router-view>
    </div>
</template>

<script setup>
import {RouterView} from "vue-router"

</script>

<style>
* {
  margin: 0%;
  padding: 0%;
  box-sizing: border-box;
}
.app {
  padding: 0px;
}
.home {
  text-align: center;
  margin-top: 25%;
}
</style>
