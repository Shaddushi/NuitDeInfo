<script setup>
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
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
        <header></header>
        <main></main>
    </div>
</template>

