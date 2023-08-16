<template>
  <div class="fetch__compliment">
    <my-output
    :compliment = "compliment"
    >
    </my-output>
    <div class="buttons">
      <my-like-button>
      </my-like-button>
      <my-button class="btn--compliment" @click="getCompliment">
        {{ buttonText }}
      </my-button>
      <my-dislike-button>
      </my-dislike-button>
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
import fetchRandomCompliment from "@/providers/fetchRandomCompliment";

const props = defineProps({
  buttonText: String,
})

const compliment = ref(null)

function getCompliment() {
  fetchRandomCompliment(compliment);
}

</script>

<style scoped>
.buttons {
  display: flex;
  flex-direction: row;
  align-items: center;
  /* width: 70%; */
}

.fetch__compliment {
  margin-bottom: 40px;
  width: 80%;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.btn--compliment {
  margin-top: 5px;
}
</style>

