import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import componentsUI from './components/UI';
import components from './components';
import { createPinia } from 'pinia'
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

app
  .use(pinia)
  .use(router)
  .mount('#app')