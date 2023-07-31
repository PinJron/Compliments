<template>
  <div class="home">
    <div class="compliment-output">
      Комплимент: {{ compliment }}
    </div>
    <my-button 
      class="btn--compliment" 
      @click="getCompliment"
    >
    FetchPost
    </my-button>

    <div class="input">
      <input class="input--compliment" v-model="message" placeholder="Введите комплимент" />
      <p>Message is: {{ message }}</p>
    </div>

    <my-button 
      class="btn--compliment" 
      @click="pushCompliment"
    >
    PushPost
    </my-button>
  </div>
</template>

<script setup>
import {ref} from 'vue'
import fetchCompliment from "@/providers/fetchCompliment";
import createCompliment from "@/providers/createCompliment";

let message = ref(null)   
const compliment = ref(null)

function getCompliment() {
  fetchCompliment(compliment);
}

function pushCompliment() {
  createCompliment(message);
}

</script>

<style>
.btn--compliment {
  margin-top: 5px;
}

.home {
  text-align: center;
  margin-top: 25%;
}

.input {
  margin-top: 5px;
}
.input--compliment {
  border-radius: 4px;
  border-color: rebeccapurple;
  background-color: rgb(238, 245, 245);
  /* padding: auto; */
  padding: 8px 80px;
  margin-bottom: 5px;
}

.compliment-output {
  background-color: rgb(238, 245, 245);
  padding: 10px 15px;
  border: 2px solid rebeccapurple;
  border-radius: 4px;
}
</style>

