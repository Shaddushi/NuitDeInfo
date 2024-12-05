<script setup>
const props = defineProps({
    buttonClass: {
        type: String,
        default: "btn btn-primary"
    }
})
import Modal from "@/components/Modal.vue";
</script>

<template>
    <modal :button-class="'btn btn-outline-secondary border-secondary border rounded-circle '+buttonClass">
        <template #button>
            <i class="bi bi-search"></i>
        </template>
    </modal>
</template>