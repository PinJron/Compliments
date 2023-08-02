<template>
  <div>
    <div class="input">
      <input class="input--compliment" v-model="login" placeholder="Введите логин" />
      <p>login is: {{ login }}</p>
    </div>
    <div class="input">
      <input class="input--compliment" v-model="password" placeholder="Введите пароль" :rules="[{ required: true, message: 'Password is required' }]" />
      <p>password is: {{ password }}</p>
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
</style>

