<script setup>
import { useCurrentUserStore } from '@/stores/CurrentUser'
import { storeToRefs } from 'pinia'

const currentUserStore = useCurrentUserStore()
const { currentUser, isLoading } = storeToRefs(currentUserStore)
</script>

<template>
  <van-row justify="space-between">
    <van-col class="title">
      <RouterLink to="/" ><h3>Posts</h3></RouterLink>
    </van-col>

    <van-col class="user-block">
      <div v-if="isLoading">
        <van-loading size="24px">Loading...</van-loading>
      </div>
      <div v-else>
        <div v-if="currentUser">
          <div class="user-bar">
            <p class="nickname">
              {{ currentUser.username }}
            </p>
            <van-button type="plain"
              @click="currentUserStore.logout"
              size="small"
            >
              <p>Logout</p>
            </van-button>
          </div>
        </div>
        <div v-else>
          <RouterLink to="/login">Login</RouterLink>
        </div>
      </div>
    </van-col>
  </van-row>
</template>

<style scoped>
.title {
  margin-left: 15px;
}
.nickname {
  margin-right: 15px;
}
.user-block {
  margin-right: 10px;
}
.user-bar {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-right: 15px;
}
</style>
