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
  console.log(user_name)
  user_name.value = data
}
const emit = defineEmits(['submitNewUserName']);


watch(user_name, (new_user_name) =>{
  emit("submitNewUserName", user_name.value); 
})

</script>

<template>
  <!-- Button trigger modal -->

  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="  bordere modal-dialog">
      <div class=" rounded-0 modal-content">
        <div class=" borderbtm gradient rounded-0   modal-header">
          <div class="h1 modal-title fs-5 title-font" id="exampleModalLabel">
            Login
          </div>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="gradient modal-body">
          <Login @submitNewUserName="formHandler"/>
        </div>
        <div class="bordertop modal-footer">
          <slot name="footer">
          </slot>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>
</template>
