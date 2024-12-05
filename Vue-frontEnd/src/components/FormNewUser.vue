<script setup>

    import { ref } from 'vue';
    import axios from 'axios';
    const user_name = ref();
    const password = ref();
    async function CreateNewUser( ) {
        let data = JSON.stringify({"user":user_name.value, "password": password.value})
        console.log(data)
        try {
            const res = await axios.post('http://localhost:8080/api/submitNewUser',data);
            console.log(res)
        } catch (error) {
            console.error('Erreur lors de la récupération du message :', error);
        }
        }


</script>



<template>
    <div> Username : </div>
    <input v-model="user_name">
    <div> password : </div>
    <input v-model="password">
    <button @click="CreateNewUser"></button>
</template>
  

  