<script setup>
import { ref, onMounted } from 'vue';
import Home from './pages/Home/Home.vue'
import Header from './partials/Header.vue'
import ModalLogin from "@/components/ModalLogin.vue";
import { RouterLink} from 'vue-router'

const user_name = ref("")
const IsLogged = ref(false)
const formHandler = (data) => {
  user_name.value = data
  IsLogged.value = true
}

</script>

<template>

    <div class="h-100">
        <div v-if="!IsLogged">
          <ModalLogin @NewForm="formHandler" />
        </div>
        <Header />
        
        
        <RouterView/>
    </div>
</template>

