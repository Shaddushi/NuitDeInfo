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

        name: {
            type: String,
            default: ""
        },

        buttonClass: {
            type: String,
            default: "btn btn-primary"
        },

        buttonId: {
            type: String,
            default: ""
        }
    })

    onMounted(() => {
        console.log(props.title)
        console.log('#test-'+props.title)
        if(props.showOnMounted) {
            const myModal = new bootstrap.Modal('#modal-'+props.name);
            myModal.show();
        }

    })
</script>

<template>
    <!-- Button trigger modal -->
    <button type="button" :id="buttonId" :class="buttonClass" data-bs-toggle="modal" :data-bs-target="'#modal-'+props.name">
        <slot name="button"></slot>
    </button>

    <!-- Modal -->
    <div class="modal fade" :id="'modal-'+props.name" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="h1 modal-title fs-5" id="exampleModalLabel">
                        {{ props.title }}
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <slot name="modal_body" />
                </div>
                <div class="modal-footer">
                    <slot name="footer">
                    </slot>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</template>
