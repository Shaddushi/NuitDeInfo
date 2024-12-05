<script setup>
  import PersonList from "./components/PersonList.vue"
  import FormNewUser from "./components/FormNewUser.vue";
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  const message = ref([]);
  const user_route = ref([]);
  onMounted(async () => {
    try {
      const response_users = await axios.get('http://localhost:8080/api/getUsers');
      const response_user = await axios.get('http://localhost:8080/api/getUser');
      message.value = response.data.users;
      user_route.value = response.data.user;
      console.log(message.value)

    } catch (error) {
      console.error('Erreur lors de la récupération du message :', error);
      message.value = 'Erreur lors de la connexion au serveur.';
    }

  });
</script>


<template>
  <div>
    <PersonList :users=message :user=user_route />
    <FormNewUser></FormNewUser>
  </div>
</template>

