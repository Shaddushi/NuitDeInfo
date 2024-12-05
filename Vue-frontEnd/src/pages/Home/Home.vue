<script setup>
    import Modal from "@/components/Modal.vue";
    import ElementModal from "@/components/ElementModal.vue";
</script>

<template>
    <div class="h-100">
        <div class="row h-100">
            <div class="col-md-6 text-center h-100 bg-warning">
                <div class="body-container mt-5 h-100 position-relative">
                    <div class="position-absolute">
                        <img src="../../assets/corps/immune_system.png" class="img-fluid position-absolute">
                        <img src="../../assets/corps/lungs.png" class="img-fluid position-absolute">
                        <img src="../../assets/corps/skin.png" class="img-fluid position-absolute">
                        <img src="../../assets/corps/brain.png" class="img-fluid position-absolute">
                        <img src="../../assets/corps/veins.png" class="img-fluid position-absolute">
                        <img src="../../assets/corps/heart.png" class="img-fluid position-absolute">
                        <img src="../../assets/corps/kidney.png" class="img-fluid position-absolute">
                        <img src="../../assets/corps/red_cells.png" class="img-fluid position-absolute">
                        <img src="../../assets/corps/bones.png" class="img-fluid position-absolute">
                        <img src="../../assets/corps/bones.png" class="img-fluid">
                    </div>

                    <ElementModal
                    buttonClass="position-absolute"
                    title="Poumons">
                        ici
                    </ElementModal>
                </div>
            </div>
            <div class="col-md-6 text-center h-100 bg-primary">poissons</div>
        </div>
    </div>
</template>

<style>
    .body-container{
        margin: 0 10% 0 10%;
    }
</style>