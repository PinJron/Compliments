import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import components from './components/UI';
// import store from './store'

const app = createApp(App)

components.forEach(component => {
  app.component(component.name, component)
})

// app = createApp(App).use(store).use(router).mount('#app')

app
  .use(router)
  .mount('#app')