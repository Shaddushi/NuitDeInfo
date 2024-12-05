<script setup>
import { ref, onMounted } from 'vue';
import Home from './pages/Home/Home.vue'
import axios from 'axios';

let ici = "aaa"
  const message = ref([]);
  onMounted(async () => {
    try {
      const response = await axios.get('http://localhost:8080/api/getUsers');
      message.value = response.data.users;
      console.log(message.value)

    } catch (error) {
      console.error('Erreur lors de la récupération du message :', error);
      message.value = 'Erreur lors de la connexion au serveur.';
    }

  });


</script>


<template>
    <div>
        <Home></Home>
    </div>
</template>

