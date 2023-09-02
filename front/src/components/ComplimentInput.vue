<template>
  <div class="push__compliment"> 
    <my-input
    v-model="message"
    :inputDataText="'Введите комплимент'"
    autofocus
    >
    </my-input>
    <my-button 
    class="btn--compliment" 
    @click="pushCompliment"
    >
      {{ buttonText }}
  </my-button>
</div>
</template>

<script>
export default {
  name: 'compliment-input'
}
</script>

<script setup>
import { ref } from 'vue'
import createCompliment from "@/providers/compliments/createCompliment";

let message = ref("")

const props = defineProps(['buttonText'])

function pushCompliment() {
  createCompliment(message.value)
  message.value = ""
}

</script>

<style scoped>
.input {
  margin-top: 5px;
}
.push__compliment {
  width: 80%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>

