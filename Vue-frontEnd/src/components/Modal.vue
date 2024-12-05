<script setup>
    import {onMounted} from "vue";

    const props = defineProps({
        showOnMounted: {
            Boolean,
            default: false
        },

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
        if(props.showOnMounted) {
            const myModal = new bootstrap.Modal('#exampleModal');
            myModal.show();
        }

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
                        {{ title }}
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <slot />
                </div>
                <div class="modal-footer">
                    <slot name="footer"></slot>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</template>
