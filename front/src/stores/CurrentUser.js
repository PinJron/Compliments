import { ref } from "vue";
import { defineStore } from "pinia";
import loginUser from "@/providers/users/loginUser";
import getUser from "@/providers/users/getUser";
import createUser from "@/providers/users/createUser";
import signOut from "@/providers/users/signOut";

export const useCurrentUserStore = defineStore("CurrentUser", () => {
  const currentUser = ref(null);
  const isAuth = ref(false);

  async function getCurrentUser() {
    currentUser.value = await getUser();
  }

  async function loginCurrentUser(resourseLogin, resoursePassword) {
    await loginUser(resourseLogin, resoursePassword);
    await getCurrentUser();
  }

  async function createCurrentUser(resourseLogin, resoursePassword) {
    await createUser(resourseLogin, resoursePassword);
    await getCurrentUser();
  }

  async function signOutCurrentUser() {
    await signOut();
    await getCurrentUser();
  }

  getCurrentUser();

  return {
    currentUser,
    isAuth,
    getCurrentUser,
    loginCurrentUser,
    signOutCurrentUser,
    createCurrentUser,
  };
});
