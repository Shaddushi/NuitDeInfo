<script setup>
import {onMounted, watch,ref} from "vue";
import Login from "../partials/Login.vue";

const props = defineProps({
  title: {
    type: String,
    default: ""
  },

  buttonClass: {
    type: String,
    default: "btn btn-primary"
  }
})

onMounted(() => {
  const myModal = new bootstrap.Modal('#exampleModal');
  myModal.show();
})

const user_name = ref("")

const formHandler = (data) => {
  user_name.value = data
}
const emit = defineEmits(['submitNewUserName']);


watch(user_name, (new_user_name) =>{
  emit("submitNewUserName", user_name.value); 
})

</script>

<template>
  <!-- Button trigger modal -->
  <button type="button" :class="buttonClass" data-bs-toggle="modal" data-bs-target="#exampleModal">
    <slot name="button"></slot>
  </button>

  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <div class="h1 modal-title fs-5" id="exampleModalLabel">
            Login
          </div>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <Login @NewForm="formHandler"/>
        </div>
        
      </div>
    </div>
  </div>
</template>
