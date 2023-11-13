<template>
  <div class="fetch__compliment">
    <my-output
    :outputDataText = "CurrentCompliment.currentCompliment.compliment"
    :placeholder = "'Ткни кнопку'"
    >
    </my-output>
    <div class="buttons"
    v-bind:style= "[CurrentCompliment.currentCompliment.compliment ? {'left': '-39.5px'} : {}]"
    >
      <my-like-button
      v-if="CurrentCompliment.currentCompliment.compliment"
      @click="rateCompliment"
      >
      </my-like-button>
      <my-button
      class="btn--compliment" 
      @click="getCompliment"
      >
        {{ buttonText }}
      </my-button>
      <!-- <my-dislike-button
      v-if="CurrentCompliment.currentCompliment.compliment_text"
      @click="rateCompliment"
      >
      </my-dislike-button> -->
    </div>
  </div>
</template>

<script>
export default {
  name: 'compliment-output'
}
</script>

<script setup>
import { ref } from 'vue'
import { useCurrentComplimentStore } from '@/stores/CurrentCompliment'

const CurrentCompliment = useCurrentComplimentStore()

// CurrentCompliment.getCurrentCompliment()

const props = defineProps({
  buttonText: String,
})

function getCompliment() {
  CurrentCompliment.getCurrentCompliment()
  CurrentCompliment.isLiked = false
}

function rateCompliment() {
  if (CurrentCompliment.isLiked == false) {
    CurrentCompliment.rateCurrentCompliment("like")
    CurrentCompliment.isLiked = !CurrentCompliment.isLiked
  } else {
    CurrentCompliment.rateCurrentCompliment("unlike")
    CurrentCompliment.isLiked = !CurrentCompliment.isLiked
  }
}

</script>

<style scoped>
.buttons {
  display: flex;
  flex-direction: row;
  align-items: baseline;
  position: relative;
  /* top: -10px; */
  /* left: -40px; */
  /* width: 70%; */
}
@keyframes poyavleniye {
    0%,25%{
      opacity: 0.0;
        }
      }
.fetch__compliment {
  margin-bottom: 40px;
  width: 80%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>

