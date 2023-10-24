<template>
  <nav-bar>
  </nav-bar>
  <div class="line"></div>
  <div class="home">
    <div>
      <my-compliment class="complim" v-for="item in complimentsArray" :outputDataText="item.compliment">
      </my-compliment>
    </div>
  </div>
</template>
  
<script setup>
// import { ref } from 'vue'
</script>

<script>
import fetchCompliments from "@/providers/compliments/fetchCompliments";
const LIMIT = 10
const OFFSET = 2

let complimentsArray = await fetchCompliments("max-liked", LIMIT, OFFSET)
</script>

<style>
.home {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.complim {
  display: flex;
  margin-top: 10px;
}
.compliment__text {
  width: 80%;
}
</style>
  