<template>
  <div class="compliment__wrapper">
    <div class="compliment__text">
        {{ compliment }}
    </div>
  </div>
</template>
    
<script>
export default {
  name: 'my-output'
}
</script>
    
<script setup>
const props = defineProps({
  // buttonText: String,
  compliment: String
})
</script>
    
<style scoped>
.compliment__wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.compliment__text {
  padding: 10px 15px;
  border: 3px solid rgb(0, 0, 0);
  border-radius: 40px;
  position: relative;
  /* font-size: 18px; */
  letter-spacing: 4px;
  background: none;
  height: fit-content;
  min-width: 600px;
  min-height: 52px;
  width: 90%;
  /* font-family: 'Fredoka One', cursive; */
  color: #e9b800;
  display: flex;
  justify-content: center;
}
</style>
    