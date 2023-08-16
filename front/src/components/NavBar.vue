<template>
  <BNavbar toggleable="lg" type="light" variant="dark">
  <BNavbarBrand href="/">Главная</BNavbarBrand>
  <BNavbarToggle target="nav-collapse" />
  <BCollapse id="nav-collapse" is-nav>
    <BNavbarNav>
      <BNavItem href="/admin">admin</BNavItem>
      <BNavItem href="/register">register</BNavItem>
      <BNavItem href="/login">login</BNavItem>
      <!-- <BNavItem href="#" disabled>Disabled</BNavItem> -->
    </BNavbarNav>
    <!-- Right aligned nav items -->
    <BNavbarNav class="me-auto mb-2 mb-lg-0">
      <!-- <BNavItemDropdown text="Lang" right>
        <BDropdownItem href="#">EN</BDropdownItem>
        <BDropdownItem href="#">ES</BDropdownItem>
        <BDropdownItem href="#">RU</BDropdownItem>
        <BDropdownItem href="#">FA</BDropdownItem>
      </BNavItemDropdown> -->
      <BNavItemDropdown right>
        <!-- Using 'button-content' slot -->
        <template #button-content>
          <em>User</em>
        </template>
        <BDropdownItem href="#">Profile</BDropdownItem>
        <BDropdownItem href="#">Sign Out</BDropdownItem>
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

</script>

<style scoped>
.bg-dark {
    --bs-bg-opacity: 1;
    background-color: rgba(250, 235, 215, var(--bs-bg-opacity)) !important;
}
</style>

