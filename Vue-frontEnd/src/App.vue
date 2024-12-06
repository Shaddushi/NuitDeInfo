<script setup>
import { ref, onMounted } from 'vue';
import { RouterLink } from 'vue-router'
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
<<<<<<< HEAD
        <div v-if="!IsLogged">
          <ModalLogin @NewForm="formHandler" />
        </div>
        <Header />
        
        
        <RouterView/>
=======

        <ModalLogin>
          <template #modal_body> <Login></Login> </template>
        </ModalLogin>
        <Header />
		<RouterView></RouterView>
>>>>>>> 470d751a0f6d6ad03183c5290f1d6d323609bb4d
    </div>
	<div>
	</div>
</template>

