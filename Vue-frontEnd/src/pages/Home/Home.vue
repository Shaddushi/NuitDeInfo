<script setup>
    import Modal from "@/components/Modal.vue";
    import ElementModal from "@/components/ElementModal.vue";
    import {computed, ref} from "vue";

    const immune_system_fish = ref(true)
    const lungs = ref(true)
    const skin_sea_ceil = ref(true)
    const brain = ref(true)
    const veins_sea_current = ref(true)
    const heart = ref(2)
    const kidney_salt = ref(true)
    const red_cells = ref(true)
    const bones_corals = ref(true)
    const thermometre = ref(3)

    const water_temperature = ref(3)
    const marees = ref(true)

    const sea_height = computed(() => {
        if (heart.value == 1){
            return 'basse'
        }
        if(heart.value == 2){
            return 'normal'
        }
        if(heart.value == 3){
            return 'haute'
        }
    })

    const heart_label = computed(() => {
        if (heart.value == 1){
            return ''
        }
    })

    const aaa = computed(() => {
        return "../../assets/ocean/"+sea_height.value
    })

    function test(value){
        console.log('ici')
        console.log(value)
    }

    function getOceanImage(img){
        return '../../assets/ocean/normal/fond.png'

    }

</script>

<template>
    <div class="h-100">
        <div class="row h-100">
            <div class="col-lg-6 text-center h-100 bg-warning">

                <div class="body-container pt-5 h-100 position-relative">

                    <img v-if="immune_system_fish" src="../../assets/corps/immune_system.png" class="img-fluid position-absolute custom-img">
                    <img v-if="lungs" src="../../assets/corps/lungs.png" class="img-fluid position-absolute custom-img">
                    <img v-if="skin_sea_ceil" src="../../assets/corps/body2.png" class="img-fluid position-absolute custom-img">
                    <img v-if="brain" src="../../assets/corps/brain.png" class="img-fluid position-absolute custom-img">
                    <img v-if="veins_sea_current" src="../../assets/corps/veins.png" class="img-fluid position-absolute custom-img">
                    <img v-if="heart != 1" src="../../assets/corps/heart.png" class="img-fluid position-absolute custom-img">
                    <img v-if="kidney_salt" src="../../assets/corps/kidney.png" class="img-fluid position-absolute custom-img">
                    <img v-if="red_cells" src="../../assets/corps/red_cells.png" class="img-fluid position-absolute custom-img">
                    <img v-if="bones_corals" src="../../assets/corps/bones.png" class="img-fluid position-absolute custom-img">
                    <img :src="'/src/assets/corps/thermometre-'+thermometre+'.png'" class="img-fluid position-absolute thermometre-img d-none d-lg-block">

                    <ElementModal
                    name="immune_system"
                    @input="v => immune_system_fish = v"
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
                    @input="v => skin_sea_ceil = v"
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
                    @input="v => veins_sea_current = v"
                        id="veins"
                        buttonClass="position-absolute button-infos"
                        title="Veines">
                        ici
                    </ElementModal>

                    <ElementModal
                    name="heart"
                    id="heart"
                    buttonClass="position-absolute button-infos"
                    title="Coeur">
                        <template #modal_body>
                            <div>
                                {{heart}}
                            </div>
                            <input type="range" class="form-range" min="1" v-model="heart" max="3" step="1">
                        </template>
                    </ElementModal>

                    <ElementModal
                    name="thermometre"
                    id="thermometre"
                    buttonClass="position-absolute button-infos"
                    title="Thermometre">
                        <template #modal_body>
                            <div>
                                {{thermometre}}
                            </div>
                            <input type="range" class="form-range" min="1" v-model="thermometre" max="5" step="1">
                        </template>
                    </ElementModal>

                    <ElementModal
                    name="kidney"
                    @input="v => kidney_salt = v"
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
                    @input="v => bones_corals = v"
                    id="bones"
                    buttonClass="position-absolute button-infos"
                    title="Squelette">
                        ici
                    </ElementModal>


                </div>
            </div>
            <div class="col-lg-6 text-center h-100 bg-info">
                <div class="pt-5 h-100 position-relative ocean-container">

                    <img :src="`/src/assets/ocean/${sea_height}/fond.png`" class="img-fluid position-absolute custom-img">
                    <img v-if="immune_system_fish" :src="`/src/assets/ocean/${sea_height}/fish.png`" class="img-fluid position-absolute custom-img">
                    <img v-if="bones_corals" :src="`/src/assets/ocean/${sea_height}/corals.png`" class="img-fluid position-absolute custom-img">
                    <img v-if="kidney_salt" :src="`/src/assets/ocean/${sea_height}/salt.png`" class="img-fluid position-absolute custom-img">
                    <img v-if="skin_sea_ceil" :src="`/src/assets/ocean/${sea_height}/sea_ceil.png`" class="img-fluid position-absolute custom-img">
                    <img v-if="veins_sea_current" :src="`/src/assets/ocean/${sea_height}/sea_current.png`" class="img-fluid position-absolute custom-img">


                    <ElementModal
                    name="bones_corals"
                    @input="v => bones_corals = v"
                    id="corals"
                    buttonClass="position-absolute button-infos"
                    title="Coraux">

                    </ElementModal>

                    <ElementModal
                        name="salt"
                        @input="v => kidney_salt = v"
                        id="salt"
                        buttonClass="position-absolute button-infos"
                        title="Salinité">
                        ici
                    </ElementModal>

                    <ElementModal
                        name="phytoplancton"
                        @input="v => red_cells = v"
                        id="phytoplancton"
                        buttonClass="position-absolute button-infos"
                        title="Phytoplancton">
                        ici
                    </ElementModal>

                    <ElementModal
                        name="marees"
                        @input="v => marees = v"
                        id="marees"
                        buttonClass="position-absolute button-infos"
                        title="Marées">
                        <template #modal_body>
                            <div>
                                {{heart}}
                            </div>
                            <input type="range" class="form-range" min="1" v-model="heart" max="3" step="1">
                        </template>
                    </ElementModal>

                    <ElementModal
                        name="cycles_oceaniques"
                        @input="v => lungs = v"
                        id="cycles_oceaniques"
                        buttonClass="position-absolute button-infos"
                        title="Cycles océaniques">
                        ici
                    </ElementModal>

                    <ElementModal
                        name="immune_system_fish"
                        @input="v => immune_system_fish = v"
                        id="fish"
                        buttonClass="position-absolute button-infos"
                        title="Biodiversité océanique">
                        ici
                    </ElementModal>

                    <ElementModal
                        name="ecosysteme_oceanique"
                        @input="v => brain = v"
                        id="ecosysteme_oceanique"
                        buttonClass="position-absolute button-infos"
                        title="Ecosystème océanique">
                        ici
                    </ElementModal>

                    <ElementModal
                        name="sea_ceil"
                        @input="v => skin_sea_ceil = v"
                        id="sea_ceil"
                        buttonClass="position-absolute button-infos"
                        title="Surface océanique">
                        ici
                    </ElementModal>

                    <ElementModal
                        name="sea_current"
                        @input="v => veins_sea_current = v"
                        id="sea_current"
                        buttonClass="position-absolute button-infos"
                        title="Courants marins">
                        ici
                    </ElementModal>


                </div>
            </div>
        </div>
    </div>
</template>

<style>

.thermometre-img{
    max-height:80%;
    top: 50%;
    left: 116%;
    z-index:99;
    transform: translate(-50%, -50%);
}
    .custom-img{
        max-height:100%;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    .body-container{
        margin: 0 10% 0 10%;
    }

    .ocean-container img{
        height:100%;
        width: 100%;
    }

    #thermometre{
        top: 79%;
        left: 116%;
        z-index: 100;
        transform: translate(-50%, -50%);
    }

    #salt{
        top: 45%;
        left: 35%;
    }
    #water_temperature{
        top: 60%;
        left: 10%;
    }
    #phytoplancton{
        top: 47%;
        left: 90%;
    }
    #marees{
        top: 38%;
        left: 50%;
    }
    #cycles_oceaniques{
        top: 72%;
        left: 58%;
    }
    #fish{
        top: 72%;
        left: 35%;
    }
    #ecosysteme_oceanique{
        top: 90%;
        left: 20%;
    }
    #sea_ceil{
        top: 38%;
        left: 20%;
    }
    #sea_current{
        top: 50%;
        left: 50%;
    }

    #corals{
        top: 82%;
        left: 75%;
    }

    #immune_system{
        left: 30%;
    }

    #lungs{
        top: 33%;
        left: 46%;
    }

    #skin{
        top: 15%;
        left: 30%;
    }

    #veins{
        top: 15%;
        left: 65%;
    }

    #heart{
        top: 26%;
        left: 46%;
    }

    #kidney{
        top: 40%;
        left: 46%;
    }

    #bones{
        top: 20%;
        left: 46%;
    }

    #red_cells{
        top: 80%;
        left: 65%;
    }

    #brain{
        @media(max-width: 2000px) {
            top: 8%;
        }
        transform: translate(-50%, -50%);
    }

    .button-infos{
        z-index: 999;

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


</style>