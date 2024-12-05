<script setup>
import { ref, onMounted } from 'vue';
import Home from './pages/Home/Home.vue'
import Header from './partials/Header.vue'
import axios from 'axios';

</script>


<template>
    <div class="h-100">
        <Header />
        <Home />
    </div>
</template>

