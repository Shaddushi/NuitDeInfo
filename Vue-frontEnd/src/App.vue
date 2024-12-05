<script setup>
import { ref, onMounted } from 'vue';
import Home from './pages/Home/Home.vue'
import Header from './partials/Header.vue'
import Modal from './components/Modal.vue';
import Login from './partials/Login.vue';
import axios from 'axios';

</script>

<template>
    <div class="h-100">

        <Modal title="Login"> 
          <template #modal_body> <Login></Login> </template> 
          <template #footer>"aaa"</template></Modal>
        <Header />
        <Home />
    </div>
</template>