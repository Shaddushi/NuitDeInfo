<script setup>
const props = defineProps({
    buttonClass: {
        type: String,
        default: "btn"
    },

    title: {
        type: String,
        defaul: ""
    },

    id: {
        type: String,
        default: ""
    },

    name:{
        type: String,
        default: ""
    }
})

const value = ref(true)
import {ref} from "vue";
import Modal from "@/components/Modal.vue";

const emit = defineEmits(['input'])

function test(){
    emit("input",!value.value)
}
</script>

<template>
    <modal
    :button-class="'btn btn-outline-secondary border-secondary border rounded-circle '+buttonClass + (value ? ' btn-light' : '')"
    :title="title"
    :has-save-button="false"
    :name="name"
    :button-id="id">
        <template #button>
            <i class="bi bi-search d-flex align-items-center justify-content-center"></i>
        </template>

        <template #modal_body>
            <slot name="modal_body">
                <div class="form-switch form-switch">
                    <input class="form-check-input fs-2" type="checkbox" v-model="value" @input="test(value)">
                    <label class="form-check-label ps-3" for="checkbox-input">Activé</label>
                </div>
            </slot>
        </template>

    </modal>
</template>