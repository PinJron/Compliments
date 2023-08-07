import { ref } from 'vue'
import { defineStore } from 'pinia'
import { useCookies } from "vue3-cookies";

export const useCurrentUserStore = defineStore('CurrentUser',() => {
  const currentUser = ref(null)
  const isLoading = ref(false)

  async function fetchUser() {
    isLoading.value = true

    const response = await fetch('api/v1/users/me', { credentials: 'include' })

    const result = await response.json()

    let user = null

    if (result?.user) {
      user = result.user
    }

    currentUser.value = user

    isLoading.value = false
    return user
  }

  function isAuthenticated() {
    if (isLoading.value) {
      return new Promise((resolve) => {
        const interval = setInterval(() => {
          if (!isLoading.value) {
            clearInterval(interval)
            resolve(!!currentUser.value)
          }
        }, 25)
      })
    } else {
      return !!currentUser.value
    }
  }

  function logout() {
    currentUser.value = null
    console.log("logout")
    const { cookies } = useCookies()

    console.log(cookies.keys())
    console.log(cookies.remove("session"))
    console.log(cookies.keys())
  }

  fetchUser()

  return { currentUser, isLoading, fetchUser, isAuthenticated, logout }
})
