<template>
  <div>
    <div class="input__wrapper">
      <input class="register__input" v-model="login" placeholder="Введите логин" />
    </div>
    <div class="input__wrapper">
      <input class="register__input" v-model="password" placeholder="Введите пароль" />
    </div>
    <my-button 
      class="btn--compliment" 
      @click="registerUser"
    >
    Зарегистрироваться
    </my-button>
  </div>
</template>

<script setup>
import {ref} from 'vue'
import createUser from "@/providers/createUser";

let login = ref(null)
let password = ref(null)

function registerUser() {
  createUser(login, password);
}

</script>

<style>
.input__wrapper {
  margin-top: 5px;
  display: flex;
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
  width: 25%;
  font-family: 'Fredoka One', cursive;
  color: #e9b800
}

.btn--compliment {
  width: 50px;
}
</style>

