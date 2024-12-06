<script setup>

  import {defineEmits, ref} from 'vue';
  import Captcha from "@/pages/Captcha/Captcha.vue";

  const checkbox_captcha = ref(false);
  const has_win = ref(false);

const input_pseudo = ref("");
const loggedin = ref(false)
const emit = defineEmits(['submitNewUserName']);

const sendForm = () => {
  loggedin.value = true
  emit("submitNewUserName", input_pseudo.value); 
};

 
    function displayPlay(){
      checkbox_captcha.value = !checkbox_captcha.value;
    }
    function hasWin(){
      has_win.value = !has_win.value;
    }
</script>

<template class="gradient">
  <p class="title-font">Welcome {{ input_pseudo }}</p>
  <div class="container-login">
    <div class="div-input">
      <input v-model="input_pseudo" placeholder="Pseudo" id="pseudo" />
    </div>
    <div v-show="!has_win">
      <div v-show="checkbox_captcha"><Captcha @update="hasWin()"/></div>
      <div class="div-captcha" v-show="!checkbox_captcha">
        <img src="../assets/captcha/recaptcha.png" alt="captcha" />
        <div class="div-input-captcha">
          <button v-on:click="displayPlay()" class="title-font">Etes vous un robot ?</button>
        </div>
      </div>
    </div>
    <div v-show="has_win" class="title-font center" >BRAVO VOUS ETES UN ROBOT</div>

  </div>
</template>
