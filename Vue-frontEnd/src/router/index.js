import { createRouter, createWebHistory } from 'vue-router'
import App from '../App.vue'

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
    },
    {
      path: '/credits',
      name: 'credits',
      component: Credits,
    },
    
  ],
})

export default router
