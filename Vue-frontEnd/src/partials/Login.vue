<script setup>
    import axios from 'axios';
    import {defineEmits, ref} from 'vue';
    import Captcha from "@/pages/Captcha/Captcha.vue";
    const password = ref("");
    const user_name = ref("");
    const input_password = ref("");
    const input_pseudo = ref("");
    const checkbox_captcha = ref(false);
    const has_win = ref(false);

    const emit = defineEmits(['submitNewUserName'])

    const sendForm = () => {
        emit("submitNewUserName",user_name.value
        ) 
    }


    async function CreateNewUser( ) {
        let data = JSON.stringify({"user":user_name.value, "password": password.value})
            axios.post('http://localhost:8080/api/submitUser',data).then(() =>{
                axios.get('http://localhost:8080/api/getUsers').then((response) =>{
                    if(response.data.login){    
                        sendForm()
                    }
                })
            }).catch((error) =>{
                console.error('Erreur lors de la récupération du message :', error);
            })
    }

    function displayPlay(){
      checkbox_captcha.value = !checkbox_captcha.value;
    }
    function hasWin(){
      has_win.value = !has_win.value;
    }

</script>


<template>
  <p class="title-font">Welcome {{ input_pseudo }}</p>
  <div class="container-login">
    <div class="div-input">
      <input v-model="input_pseudo" placeholder="Pseudo" id="pseudo" />
      <input v-model="input_password" placeholder="password" id="password" autocomplete="off" />
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