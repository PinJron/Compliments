<template>
  <nav-bar>
  </nav-bar>
  <div class="line"></div>
  <div class="home">
    <div class="nametag">
      Получить приятность
    </div>
    <compliment-output button-text="Гони сюда!">
    </compliment-output>
  </div>
</template>

<script setup>
import { useCounterStore } from '@/stores/counter';

const counter = useCounterStore()
</script>

<style>
</style>

