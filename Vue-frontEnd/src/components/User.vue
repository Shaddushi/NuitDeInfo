<script setup>
import {computed, defineProps} from "vue"

const props = defineProps(
  {
    users:{
      user_id: Number,
      user_name: String,
      user_description: String
    },
    user:{
      user_id: Number,
      user_pseudo: String,
      user_mdp: String
    }
  })

const users = computed(() => props.users)
const user = computed(() => props.user)
console.log(user.value)

</script>



<template>
    <div v-for="user in users">
      {{ user.user_name }}
    </div>
    <div v-for="us in user">
      {{ us.user_pseudo }}
    </div>
</template>
  

  