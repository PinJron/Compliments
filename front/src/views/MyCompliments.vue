<template>
  <nav-bar>
  </nav-bar>
  <div class="line"></div>
  <div class="home">
    <div v-if="!currentUser?.username" class="nametag">
      Сначала надо залогиниться!
    </div>
    <div v-if="currentUser?.username">
      <div class="nametag">
        Привет {{ currentUser.username }}!
      </div>
      <label for="my-output">Твой логин</label>
      <my-output :outputDataText="currentUser.username">
      </my-output>
      <label for="my-output">role_id</label>
      <my-output :outputDataText="currentUser.role_id">
      </my-output>
      <!-- <label for="my-output">password_digest</label>
      <my-output :outputDataText="currentUser.password_digest">
      </my-output> -->
    </div>
  </div>
</template>

<script setup>
import { useCurrentUserStore } from '@/stores/CurrentUser'
import { storeToRefs } from 'pinia'

const CurrentUser = useCurrentUserStore()
const { currentUser, isLoading } = storeToRefs(CurrentUser)
console.log(currentUser)
</script>

<style>
.home {
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>
