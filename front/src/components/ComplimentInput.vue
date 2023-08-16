<template>
  <div class="push__compliment"> 
    <div class="input">
      <input 
      class="input--compliment" 
      v-model="message" 
      placeholder="Введите комплимент" />
    </div>
    <my-button 
    class="btn--compliment" 
    @click="pushCompliment">
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
import createCompliment from "@/providers/createCompliment";

let message = ref(null)
const props = defineProps(['buttonText'])
// let variable = ref("123")
function pushCompliment() {
  if (createCompliment(message) == true) {
    message.value = ""
  }
}

</script>

<style scoped>

.input--compliment {
  padding: 10px 15px;
  border: 3px solid rgb(0, 0, 0);
  border-radius: 40px;
  position: relative;
  font-size: 18px;
  letter-spacing: 4px;
  background: none;
  height: fit-content;
  width: 70%;
  font-family: 'Fredoka One';
  color: #e9b800
}
.input {
  margin-top: 5px;
}
.push__compliment {
  width: 50%;
}
</style>

