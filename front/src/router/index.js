import { createRouter, createWebHistory } from 'vue-router'
import MainPage from '../views/MainPage.vue'
import RegisterPage from '../views/RegisterPage.vue'
import LoginPage from '../views/LoginPage.vue'
import AdminPage from '../views/AdminPage.vue'
import Profile from '../views/Profile.vue'

const routes = [
  {
    path: '/',
    component: MainPage
  },
  {
    path: '/register',
    component: RegisterPage
  },
  {
    path: '/admin',
    component: AdminPage
  },
  {
    path: '/login',
    component: LoginPage
  },
  {
    path: '/profile',
    component: Profile
  },
]

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes
})

export default router
