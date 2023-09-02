import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue-next/dist/bootstrap-vue-next.css'
import axios from "axios"
import { createPinia } from 'pinia'
import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import componentsUI from './components/UI';
import components from './components';
import { useCurrentUserStore } from '@/stores/CurrentUser'
// import store from './store'

const pinia = createPinia()
const app = createApp(App)

componentsUI.forEach(component => {
  app.component(component.name, component)
})

components.forEach(component => {
  app.component(component.name, component)
})

// app = createApp(App).use(store).use(router).mount('#app')
const ax = axios.create({
  baseURL: '',
  withCredentials: true,
});
export default ax;

app
  .use(pinia)
  .use(router)
  .mount('#app')
  
// const CurrentUser = useCurrentUserStore()