<template>
  <div class="fetch__compliment"> 
    <div class="compliment__wrapper">
      <div class="compliment__text">
        Комплимент: {{ compliment }}
      </div>
    </div>
    <my-button 
    class="btn--compliment" 
    @click="getCompliment"
    >
    FetchPost
   </my-button>
  </div>
</template>

<script>
export default {
  name: 'compliment-output'
}
</script>

<script setup>
import {ref} from 'vue'
import fetchRandomCompliment from "@/providers/fetchRandomCompliment";
import createCompliment from "@/providers/createCompliment";

const compliment = ref(null)

function getCompliment() {
  fetchRandomCompliment(compliment);
}

</script>

<style scoped>
.fetch__compliment {
  margin-bottom: 40px;
}
.btn--compliment {
  margin-top: 5px;
}
.compliment__wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.compliment__text {
  padding: 10px 15px;
  border: 3px solid rgb(0, 0, 0);
  border-radius: 40px;
  position: relative;
  font-size: 18px;
  letter-spacing: 4px;
  background: none;
  height: fit-content;
  width: 70%;
  font-family: 'Fredoka One', cursive;
  color: #e9b800;
  display: flex;
  justify-content: center;
}
</style>

