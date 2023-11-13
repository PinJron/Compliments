<template>
  <nav-bar>
  </nav-bar>
  <div class="line"></div>
  <div class="home">
    <div style="display: flex;">
      <div>
        <my-compliment 
        class="likes" 
        v-for="item in complimentsArray" 
        :outputDataText="item.likes"
        >
        </my-compliment>
      </div>
      <div>
        <my-compliment 
        class="complim" 
        v-for="item in complimentsArray" 
        :outputDataText="item.compliment"
        >
        </my-compliment>
      </div>
    </div>
  </div>
  <div style="display: flex; justify-content: center; margin-top: 5px;;">
    <button
    @click="getCompliments">
      Fetch
    </button>
  </div>
</template>
  
<script setup>
import { ref } from 'vue'
import fetchCompliments from "@/providers/compliments/fetchCompliments";
const LIMIT = 10
const OFFSET = 2

let complimentsArray = ref(null)

async function getCompliments() {
  complimentsArray.value = await fetchCompliments("max-liked", LIMIT, OFFSET)
  console.log(complimentsArray.value)
}
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
.likes {
  display: flex;
  margin-top: 10px;
  min-width: 10px;
}
.compliment__text {
  width: 80%;
}
</style>
  