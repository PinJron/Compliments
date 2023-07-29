<template>
  <div class="home">
    <div class="compliment-output">
      compliment here {{ compliment }}
    </div>
    <my-button 
      class="btn--compliment" 
    >
    FetchPosts
    </my-button>
  </div>
</template>

<script>
import {ref} from 'vue'
// import fetchCompliment from "@/store/fetchCompliment"

// const compliment = ref(null)

// fetchCompliment("12312");

// import axios from "axios"

// export default async function fetchCompliment(resourse){
//   // тут надо сделать реквест на бек и сохранить в переменную комплимент
//   console.log("fetchCompliment")
//   const response = await axios.get('api/compliments');
//   console.log(response);
//   if (response.data.status == "ok") {
//     resourse = response.data.name;
//   }
//   else {
//     resourse = "idi nahuy";
//   }
// }

</script>

<style lang="scss">
.btn--compliment {
}

.home {
  text-align: center;
}

.compliment-output {
  background-color: rgb(185, 208, 208);
  padding: 10px 15px;
  border: 2px solid rebeccapurple;
  border-radius: 4px;
}
</style>

