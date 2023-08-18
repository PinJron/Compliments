<template>
  <nav-bar>
  </nav-bar>
  <div class="line"></div>
  <div class="home">
    <div v-if="!username">
      <div class="nametag">
        Сначала надо залогиниться!
      </div>
      <!-- <my-button @click="getMyUser">
    </my-button> -->
    </div>
    <div v-if="username">
      <div class="nametag">
        Привет {{ username }}!
      </div>
      <label for="my-output">Твой логин</label>
      <my-output :outputDataText="username">
      </my-output>
      <label for="my-output">Soon</label>
      <my-output :outputDataText="'Soon'">
      </my-output>
      <label for="my-output">Soon</label>
      <my-output :outputDataText="'Soon'">
      </my-output>
    </div>
    <!-- <my-button @click="getMyUser">
    </my-button> -->
  </div>
</template>

<script setup>
import { ref, onBeforeMount } from 'vue'
import getCurrentUser from "@/providers/getCurrentUser";

let user = ref(null)

async function getMyUser() {
  user = await getCurrentUser()
  // console.log(user + "123")
}

// let answer = await getCurrentUser()
// if (answer == "error_access_not_allowed") {
//   el = "mama"
//   console.log("mama")
// }
// else {
//   el = answer
//   console.log("papa")
// }

</script>

<script>
let username = ref("")
username = await getCurrentUser()
</script>

<style>
.home {
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>
  
