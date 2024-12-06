<script setup>
import { ref, onMounted } from 'vue';
import Home from './pages/Home/Home.vue'
import Header from './partials/Header.vue'
import Modal from './components/Modal.vue';
import Login from './partials/Login.vue';
import axios from 'axios';
import ModalLogin from "@/components/ModalLogin.vue";

</script>

<template>

    <div class="h-100">

        <ModalLogin>
          <template #modal_body> <Login></Login> </template>
          <template #footer>"aaa"</template>
        </ModalLogin>
        <Header />
        <Home />
    </div>
</template>

