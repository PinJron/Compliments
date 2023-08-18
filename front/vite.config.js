import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { fileURLToPath, URL } from 'node:url'
import Components from 'unplugin-vue-components/vite'
import {BootstrapVueNextResolver} from 'unplugin-vue-components/resolvers'


// https://vitejs.dev/config/
export default defineConfig({
  build: {
    target: 'esnext' //browsers can handle the latest ES features
  },
  server: {
    proxy: {
      '/api': 'http://localhost:4567',
    }
  },
  plugins: [
    vue(),
    Components({
      resolvers: [BootstrapVueNextResolver()],
    }),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
})