<template>
  <div class="home">
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

    <div class="input">
      <input class="input--compliment" v-model="message" placeholder="Введите комплимент" />
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
import fetchRandomCompliment from "@/providers/fetchRandomCompliment";
import createCompliment from "@/providers/createCompliment";

let message = ref(null)   
const compliment = ref(null)

function getCompliment() {
  fetchRandomCompliment(compliment);
}

function pushCompliment() {
  if (createCompliment(message) == true) {
    message.value = ""
  }
}

</script>

<style>
.fetch__compliment {
  margin-bottom: 40px;
}

.btn--compliment {
  margin-top: 5px;
}

.home {
  text-align: center;
  margin-top: 25%;
}

.input--compliment {
  padding: 10px 15px;
  border: 3px solid rgb(0, 0, 0);
  border-radius: 40px;
  position: relative;
  font-size: 18px;
  letter-spacing: 4px;
  height: fit-content;
  width: 70%;
  font-family: 'Fredoka One', cursive;
  color: #e9b800
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

