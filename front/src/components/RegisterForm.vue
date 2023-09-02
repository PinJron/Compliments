<template>
  <div class="register-form">
    <div class="input__wrapper">
      <my-input
      v-model="login" 
      autofocus
      :inputDataText="'Введите логин'"
      />
    </div>
    <div class="input__wrapper">
      <my-input
      type="password"
      autocomplete="current-password"
      v-model="password" 
      :inputDataText="'Введите пароль'" 
      />
    </div>
    <my-button 
      class="btn--compliment" 
      @click="registerUser"
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
import { storeToRefs } from 'pinia'
import { useCurrentUserStore } from '@/stores/CurrentUser'

const props = defineProps(['buttonText'])

const CurrentUser = useCurrentUserStore()
const { currentUser } = storeToRefs(CurrentUser)

let login = ref("")
let password = ref("")

function registerUser() {
  CurrentUser.createCurrentUser(login, password);
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
  min-width: fit-content;
  width: 30%;
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

