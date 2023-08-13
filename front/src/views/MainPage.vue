<template>
  <div class="home">
    <div>
      <compliment-output>
      </compliment-output>
      <!-- <my-like-button>
        123
      </my-like-button> -->
    </div>
  </div>
</template>

<script setup>
import { useCounterStore } from '@/stores/counter';

const counter = useCounterStore()
</script>

<style>
</style>

