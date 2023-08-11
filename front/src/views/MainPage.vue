<template>
  <div class="home">
    <div>
      <div class="compliment__wrapper">
        <div class="compliment__text">
          Комплимент: {{ compliment }}
        </div>
      </div>
      <my-button 
      class="btn--compliment" 
      @click="getCompliment()"
      >
      Гони сюда
    </my-button>
      <!-- <my-like-button>
        123
      </my-like-button> -->
    </div>
  </div>
</template>

<script setup>
import {ref} from 'vue'
import fetchRandomCompliment from "@/providers/fetchRandomCompliment";
import fetchComplimentById from "@/providers/fetchComplimentById";

import createCompliment from "@/providers/createCompliment";
import { useCounterStore } from '@/stores/counter';

const counter = useCounterStore()
const compliment = ref(null)


function getCompliment() {
  fetchRandomCompliment(compliment);
  counter.increment()
}

  // function pushCompliment() {
//   createCompliment(message);
// }
</script>

<style>
.btn--compliment {
  margin-top: 5px;
}

.compliment__wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
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
</style>

