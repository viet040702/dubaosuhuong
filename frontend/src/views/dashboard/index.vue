<script setup lang="ts">
import NavBar from "../../layouts/NavBar/index.vue";
import UserList from "../dashboard/UserList/index.vue";
</script>
<template>
  <div class="container-dasboard">
    <NavBar />
    <div class="container-list-user">
      <UserList />
    </div>
  </div>
</template>
<style lang="scss" scoped>
.container-dasboard {
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
