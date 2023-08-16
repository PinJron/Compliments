<template>
  <div class="register-form">
    <div class="input__wrapper">
      <input class="register__input" 
      v-model="login" 
      placeholder="Введите логин" />
    </div>
    <div class="input__wrapper">
      <input class="register__input" 
      v-model="password" 
      placeholder="Введите пароль" />
    </div>
    <my-button 
      class="btn--compliment" 
      @click="loginUser"
    >
    {{ buttonText }}
    </my-button>
  </div>
</template>

<script>
export default {
  name: 'register-form'
}
</script>

<script setup>
import {ref} from 'vue'
import logUser from "@/providers/logUser";
const props = defineProps(['buttonText'])
let login = ref(null)
let password = ref(null)

function loginUser() {
  logUser(login, password);
}
</script>

<style scoped>
.input__wrapper {
  margin-top: 5px;
  display: flex;
  width: 70%;
  flex-direction: column;
  align-items: center;
}
.register__input {
  padding: 10px 15px;
  border: 3px solid rgb(0, 0, 0);
  border-radius: 40px;
  position: relative;
  font-size: 18px;
  letter-spacing: 4px;
  background: none;
  height: 60px;
  width: 30%;
  font-family: 'Fredoka One', cursive;
  color: #e9b800;
  display: flex;
  justify-content: center;
}
.btn--compliment {
  width: 50px;
}
.register-form {
  margin-top: 50px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>

