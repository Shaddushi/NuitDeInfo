<script setup>
import { ref, onMounted } from 'vue';
import { RouterLink } from 'vue-router'
import Home from './pages/Home/Home.vue'
import Header from './partials/Header.vue'
import ModalLogin from "@/components/ModalLogin.vue";

const user_name = ref("")
const IsLogged = ref(false)
const formHandler = (data) => {
  user_name.value = data
  IsLogged.value = true
}

</script>

<template>

    <div class="h-100">

        <ModalLogin @submitNewUserName="formHandler">
        </ModalLogin>
        <Header :name="user_name" />
		<RouterView></RouterView>
    </div>
	<div>
	</div>
</template>

