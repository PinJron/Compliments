<template>
  <div class="input">
    <input 
    class="input--compliment" 
    v-model="message" 
    placeholder="Введите комплимент" />
  </div>
</template>
  
<script>
export default {
  name: 'my-input'
}
</script>
  
<script setup>

</script>
  
<style scoped>
.input--compliment {
  padding: 10px 15px;
  border: 3px solid rgb(0, 0, 0);
  border-radius: 40px;
  position: relative;
  font-size: 18px;
  letter-spacing: 4px;
  background: none;
  height: fit-content;
  min-width: 600px;
  width: 70%;
  /* font-family: 'Fredoka One'; */
  color: #e9b800
}
.input {
  margin-top: 5px;
}</style>
  
  