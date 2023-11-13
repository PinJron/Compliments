<template>
  <BNavbar toggleable="lg" type="light" variant="dark">
  <BNavbarBrand to="/">Главная</BNavbarBrand>
  <BNavbarToggle target="nav-collapse" />
  <BCollapse id="nav-collapse" is-nav>
    <BNavbarNav>
      <BNavItem v-if="currentUser?.role_id !=2" class="link" to="/admin">Admin</BNavItem>
      <BNavItem v-if="!currentUser?.username" class="link" to="/register">Register</BNavItem>
      <BNavItem 
      v-if="!currentUser?.username"
      class="link" 
      to="/login"
      >
      Login</BNavItem>
      <BNavItem class="link" to="/all_compliments">All</BNavItem>
      <!-- <BNavItem href="#" disabled>Disabled</BNavItem> -->
    </BNavbarNav>
    <!-- Right aligned nav items -->
    <BNavbarNav class="me-auto mb-2 mb-lg-0">
      <!-- <BNavItemDropdown text="Lang" right>
        <BDropdownItem to="#">EN</BDropdownItem>
        <BDropdownItem to="#">ES</BDropdownItem>
        <BDropdownItem to="#">RU</BDropdownItem>
        <BDropdownItem to="#">FA</BDropdownItem>
      </BNavItemDropdown> -->
      <BNavItemDropdown v-if="currentUser?.username" right>
        <!-- Using 'button-content' slot -->
        <template #button-content>
          <em>{{currentUser.username}}</em>
        </template>
        <BDropdownItem to="/profile">Profile</BDropdownItem>
        <BDropdownItem to="/my_compliments">My compliments</BDropdownItem>
        <BDropdownItem
        @click="signOut"
        >
        Sign Out
        </BDropdownItem>
      </BNavItemDropdown>
    </BNavbarNav>
    <!-- <BNavForm class="d-flex">
      <BFormInput class="me-2" placeholder="Search" />
      <BButton type="submit" variant="outline-success">Search</BButton>
    </BNavForm> -->
  </BCollapse>
</BNavbar>
</template>

<script>
export default {
  name: 'nav-bar'
}
</script>

<script setup>
import { storeToRefs } from 'pinia'
import { useCurrentUserStore } from '@/stores/CurrentUser'

const CurrentUser = useCurrentUserStore()
const { currentUser, isLoading } = storeToRefs(CurrentUser)

function signOut() {
  CurrentUser.signOutCurrentUser()
}

console.log(currentUser.username)
</script>

<style scoped>
.bg-dark {
    --bs-bg-opacity: 1;
    background-color: rgba(250, 235, 215, var(--bs-bg-opacity)) !important;
}
</style>

