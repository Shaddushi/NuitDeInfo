<script setup>
    import { RouterLink } from 'vue-router';
</script>


<template>
        <header class="bg-secondary py-4">
            <div class="container d-flex justify-content-between">
                <div>
                    <a href="/" class="text-white text-decoration-none title-font">SEaXfriends</a>
                </div>

                <div>
                    <nav id="nav-bar">
                        <RouterLink to="/">Home</RouterLink>
                        <RouterLink to="/credits">Credits</RouterLink>
                        <RouterLink to="/succes">Succes</RouterLink>
                    </nav>
                </div>

            </div>

        </header>
</template>