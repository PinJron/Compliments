<template>
    <div class="app">
      <router-view></router-view>
    </div>
</template>

<script setup>
import {RouterView} from "vue-router"

</script>

<style>
:root {
  --selection-bg-color: #4d4d4d;
}

* {
  margin: 0%;
  padding: 0%;
  box-sizing: border-box;
}
.app {
  padding: 0px;
  font-family: 'Flow Ext';
}
.home {
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.line {
  background-color: rgb(0, 0, 0);
  /* Цвет линии */
  color: rgb(0, 0, 0);
  /* Цвет линии для IE6-7 */
  height: 3px;
  /* Толщина линии */
}

@font-face {
    font-family: 'Flow Ext';
    src: local('Flow Ext'), local('FlowExt'), 
    url('../assets/fonts/flow/flowext.woff2') format('woff2'), 
    url('..@/assets/fonts/flow/flowext.woff') format('woff'), 
    url('..@/assets/fonts/flow/flowext.ttf') format('truetype');
    font-weight: 400;
    font-style: normal;
}
@font-face {
    font-family: 'Flow Ext';
    src: local('Flow Ext Bold'), local('FlowExt-Bold'), 
    url('..@/assets/fonts/flow/flowextbold.woff2') format('woff2'), 
    url('..@/assets/fonts/flow/flowextbold.woff') format('woff'), 
    url('..@/assets/fonts/flow/flowextbold.ttf') format('truetype');
    font-weight: 700;
    font-style: normal;
}

input::selection {
  background: var(--selection-bg-color)
}

input {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>
