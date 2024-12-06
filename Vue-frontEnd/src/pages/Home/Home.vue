<script setup>
    import Modal from "@/components/Modal.vue";
    import ElementModal from "@/components/ElementModal.vue";
    import {ref} from "vue";

    const immune_system = ref(true)
    const lungs = ref(true)
    const skin = ref(true)
    const brain = ref(true)
    const veins = ref(true)
    const heart = ref(true)
    const kidney = ref(true)
    const red_cells = ref(true)
    const bones = ref(true)

    function test(value){
        console.log('ici')
        console.log(value)
    }
</script>

<template>
    <div class="h-100">
        <div class="row h-100">
            <div class="col-lg-6 text-center h-100 bg-warning">
                <div class="body-container pt-5 h-100 position-relative">

                    <img v-if="immune_system" src="../../assets/corps/immune_system.png" class="img-fluid position-absolute custom-img">
                    <img v-if="lungs" src="../../assets/corps/lungs.png" class="img-fluid position-absolute custom-img">
                    <img v-if="skin" src="../../assets/corps/body2.png" class="img-fluid position-absolute custom-img">
                    <img v-if="brain" src="../../assets/corps/brain.png" class="img-fluid position-absolute custom-img">
                    <img v-if="veins" src="../../assets/corps/veins.png" class="img-fluid position-absolute custom-img">
                    <img v-if="heart" src="../../assets/corps/heart.png" class="img-fluid position-absolute custom-img">
                    <img v-if="kidney" src="../../assets/corps/kidney.png" class="img-fluid position-absolute custom-img">
                    <img v-if="red_cells" src="../../assets/corps/red_cells.png" class="img-fluid position-absolute custom-img">
                    <img v-if="bones" src="../../assets/corps/bones.png" class="img-fluid position-absolute custom-img">


                    <ElementModal
                    name="immune_system"
                    @input="v => immune_system = v"
                    id="immune_system"
                    buttonClass="position-absolute button-infos"
                    title="Système immunitaire">
                        ici
                    </ElementModal>

                    <ElementModal
                    name="lungs"
                    @input="v => lungs = v"
                    id="lungs"
                    buttonClass="position-absolute button-infos"
                    title="Poumons">
                        ici
                    </ElementModal>

                    <ElementModal
                    name="skin"
                    @input="v => skin = v"
                        id="skin"
                        buttonClass="position-absolute button-infos"
                        title="Peau">
                        ici
                    </ElementModal>

                    <ElementModal
                    name="brain"
                    @input="v => brain = v"
                    id="brain"
                    buttonClass="position-absolute button-infos"
                    title="Cerveau">
                        ici
                    </ElementModal>

                    <ElementModal
                    name="veins"
                    @input="v => veins = v"
                        id="veins"
                        buttonClass="position-absolute button-infos"
                        title="Veines">
                        ici
                    </ElementModal>

                    <ElementModal
                    name="heart"
                    @input="v => heart = v"
                    id="heart"
                    buttonClass="position-absolute button-infos"
                    title="Coeur">
                        ici
                    </ElementModal>

                    <ElementModal
                    name="kidney"
                    @input="v => kidney = v"
                    id="kidney"
                    buttonClass="position-absolute button-infos"
                    title="Reins">
                        ici
                    </ElementModal>

                    <ElementModal
                    name="red_cells"
                    @input="v => red_cells = v"
                    id="red_cells"
                    buttonClass="position-absolute button-infos"
                    title="Globules rouges">
                        ici
                    </ElementModal>

                    <ElementModal
                    name="bones"
                    @input="v => bones = v"
                    id="bones"
                    buttonClass="position-absolute button-infos"
                    title="Squelette">
                        ici
                    </ElementModal>

                </div>
            </div>
            <div class="col-lg-6 text-center h-100 position-relative">ici</div>
        </div>
    </div>
</template>

<style>
    .custom-img{
        max-height:100%;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    .body-container{
        margin: 0 10% 0 10%;
    }

    #immune_system{
        left: 30%;
    }

    #lungs{
        top: 50%;
        left: 46%;
    }

    #skin{
        top: 25%;
        left: 30%;
    }

    #veins{
        top: 25%;
        left: 65%;
    }

    #heart{
        top: 62%;
        left: 46%;
    }

    #kidney{
        top: 80%;
        left: 46%;
    }

    #bones{
        top: 40%;
        left: 46%;
    }

    #red_cells{
        top: 166%;
        left: 65%;
    }

    #brain{
        @media(max-width: 2000px) {
            top: 8%;
        }
        transform: translate(-50%, -50%);
    }

    .button-infos{
        @media(max-width: 2000px){
            width: 45px;
            height: 45px;
        }

        @media(max-width: 1600px){
            width: 40px;
            height: 40px;
        }

        @media(max-width: 1200px){
            width: 35px;
            height: 35px;
        }

        @media(max-width: 950px){
            width: 30px;
            height: 30px;
        }

        @media(max-width: 800px){
            width: 30px;
            height: 30px;
        }

        @media(max-width: 700px){
            width: 30px;
            height: 30px;
        }

        @media(max-width: 600px){
            width: 40px;
            height: 40px;
        }

        @media(max-width: 500px){
            height: 30px;
            top: 5%;
        }
    }

    .image-container {
        position: relative;
        width: 100%; /* Ajuste automatiquement à la largeur parent */
        max-width: 800px; /* Exemple de largeur maximale */
        margin: 0 auto; /* Centrer horizontalement */
    }

    .image-container img {
        width: 100%; /* L'image occupe toute la largeur du conteneur */
        display: block;
    }

    .selector-button {
        position: absolute;
        top: 50%; /* Positionner à 50% de la hauteur du conteneur */
        left: 50%; /* Positionner à 50% de la largeur du conteneur */
        transform: translate(-50%, -50%); /* Centrer le bouton */
        padding: 10px 20px;
        background-color: rgba(255, 255, 255, 0.8);
        border: 1px solid #000;
        border-radius: 5px;
        cursor: pointer;
    }

    .cls-1 {
        fill: #ffb787;
    }

</style>