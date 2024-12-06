<script setup>
import { defineEmits, ref } from 'vue';

const input_pseudo = ref("");
const loggedin = ref(false)
const emit = defineEmits(['submitNewUserName']);

const sendForm = () => {
  loggedin.value = true
  emit("submitNewUserName", input_pseudo.value); 
};

</script>

<template>
  <p>Welcome {{ input_pseudo }}</p>
  <div class="container-login">
    <div class="div-input">
      <input v-model="input_pseudo" placeholder="Pseudo" id="pseudo" />
    </div>
    <div class="div-captcha">
      <img src="../assets/captcha/recaptcha.png" alt="captcha" />
    </div>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-primary" @click="sendForm()">Save changes</button>
  </div>
</template>
