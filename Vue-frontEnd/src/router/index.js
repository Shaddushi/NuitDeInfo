import { createRouter, createWebHistory } from 'vue-router'
import App from '../App.vue'
import Home from '../pages/Home/Home.vue'
import Succes from "@/pages/Succes/Succes.vue";
import Credits from "@/pages/Credits/Credits.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/succes',
      name: 'succes',
      component: Succes,
    }

  ],
})

export default router
