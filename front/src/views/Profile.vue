<template>
  <nav-bar>
  </nav-bar>
  <div class="line"></div>
  <div class="home">
    <my-output
    :compliment = "user"
    >
    </my-output>
    <my-button
    @click="getCurrentUser"
    >
    </my-button>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import getUser from "@/providers/getUser";

let user = ref(null)

async function getCurrentUser() {
  user = await getUser()
  // console.log(user + "123")
}
</script>

<style>
.line {
    background-color: rgb(0, 0, 0); /* Цвет линии */
    color: rgb(0, 0, 0); /* Цвет линии для IE6-7 */
    height: 3px; /* Толщина линии */
   }
.home {
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>
  
