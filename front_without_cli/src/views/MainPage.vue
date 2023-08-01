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
  padding: 10px 15px;
  border: 3px solid rgb(0, 0, 0);
  border-radius: 40px;
  position: relative;
  font-size: 18px;
  letter-spacing: 4px;
  background: none;
  height: fit-content;
  width: 100%;
  font-family: 'Fredoka One', cursive;
  color: #e9b800
}

.compliment-output {
  padding: 10px 15px;
  border: 3px solid rgb(0, 0, 0);
  border-radius: 40px;
  position: relative;
  font-size: 18px;
  letter-spacing: 4px;
  background: none;
  height: fit-content;
  width: 100%;
  font-family: 'Fredoka One', cursive;
  color: #e9b800
}
</style>

