<script setup lang="ts">
import NavBar from "../../layouts/NavBar/index.vue";
import CompanyList from "./CompanyList/index.vue";
</script>
<template>
  <div class="container-dashboard">
    <NavBar />
    <div class="container-list-user">
      <CompanyList />
    </div>
  </div>
</template>
<style lang="scss" scoped>
.container-dashboard {
  width: 100%;
  height: 100%;
  background: white;
  display: flex;
  overflow-x: hidden;
}

.container-list-user {
  margin: 24px;
  width: 100%;
}
</style>
