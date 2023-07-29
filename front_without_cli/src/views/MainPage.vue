<template>
  <div class="home">
    <div class="compliment-output">
      compliment here {{ compliment }}
    </div>
    <my-button 
      class="btn--compliment" 
      @click="getCompliment"
    >
    FetchPosts
    </my-button>
  </div>
</template>

<script setup>
import {ref} from 'vue'
import fetchCompliment from "@/providers/fetchCompliment"

const compliment = ref(null)

function getCompliment() {
  fetchCompliment(compliment);
}

</script>

<style>
.btn--compliment {
}

.home {
  text-align: center;
}

.compliment-output {
  background-color: rgb(200, 208, 208);
  padding: 10px 15px;
  border: 2px solid rebeccapurple;
  border-radius: 4px;
}
</style>

