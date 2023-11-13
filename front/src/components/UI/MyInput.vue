<template>
  <div class="input">
    <input 
    :type="`${input_type}`"
    class="input--compliment" 
    :value="modelValue" 
    @input="$emit('update:modelValue', $event.target.value)"
    :placeholder="`${inputDataText}`" />
  </div>
</template>
  
<script>
export default {
  name: 'my-input'
}
</script>
  
<script setup>

const props = defineProps({
  inputDataText: String,
  modelValue: String,
  input_type: String
})

defineEmits(['update:modelValue'])

// const emits = defineEmits({
//   update: message
// })
</script>
  
<style scoped>
.input--compliment {
  padding: 10px 15px;
  border: 3px solid rgb(0, 0, 0);
  border-radius: 40px;
  position: relative;
  letter-spacing: 4px;
  font-size: 18px;
  background: none;
  height: fit-content;
  min-width: 300px;
  min-height: 52px;
  color: #e9b800;
  display: flex;
  justify-content: center;
}

.input {
  margin-top: 5px;
}
</style>
  
  