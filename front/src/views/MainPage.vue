<template>
  <nav-bar>
  </nav-bar>
  <div class="line"></div>
  <div class="home">
  <compliment-output
  button-text = "Гони сюда!"
  >
  </compliment-output>
  </div>
</template>

<script setup>
import { useCounterStore } from '@/stores/counter';

const counter = useCounterStore()
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

