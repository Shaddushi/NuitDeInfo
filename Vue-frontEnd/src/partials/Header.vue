<script setup>
    import { RouterLink } from 'vue-router';

    const props = defineProps({
        name: {
            String,
            default: "anonymous"
        }
    })

</script>


<template>
        <header class="bgcoLor bg-secondary py-4">
            <div class="container d-flex justify-content-between">
                <div>
                    <a href="/" >
                        <img src="../assets/logo.png" class="logo">
                    </a>
                </div>

                <div>
                    <nav id="nav-bar" class="center">
                        <div v-if="name">
                        Bonjour  {{ name }}
                    </div>
                        <RouterLink class="e" to="/">Home</RouterLink>
                        <RouterLink class="e"  to="/succes">Succes</RouterLink>
                    </nav>
              
                </div>

            </div>

        </header>
</template>