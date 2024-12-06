<script setup>
    import axios from 'axios';
    import { defineEmits } from 'vue';
    import {ref} from "vue";
    const password = ref("");
    const user_name = ref("");

    const emit = defineEmits(['submitNewUserName'])

    const sendForm = () => {
        emit("submitNewUserName",user_name.value
        ) 
    }


    async function CreateNewUser( ) {
        let data = JSON.stringify({"user":user_name.value, "password": password.value})
            axios.post('http://localhost:8080/api/submitUser',data).then(() =>{
                axios.get('http://localhost:8080/api/getUsers').then((response) =>{
                    if(response.data.login){    
                        sendForm()
                    }
                })
            }).catch((error) =>{
                console.error('Erreur lors de la récupération du message :', error);
            })
    }
</script>


<template>
    <div> Hello !</div>

</template>