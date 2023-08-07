import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import components from './components/UI';
import { createPinia } from 'pinia'
// import store from './store'

const pinia = createPinia()
const app = createApp(App)

components.forEach(component => {
  app.component(component.name, component)
})

// app = createApp(App).use(store).use(router).mount('#app')

app
  .use(pinia)
  .use(router)
  .mount('#app')