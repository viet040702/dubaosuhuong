<template>
  <div class="container-list">
    <div class="container-search">
      <div class="container-left">
        <h1>List Company</h1>
        <span class="input-search">
          <el-icon class="icon-search"><Search /></el-icon>
          <input
            type="text"
            v-model="keySearch"
            placeholder="Enter name, email..."
          />
        </span>
      </div>
      <div class="button-create">
        <button>Create User</button>
      </div>
    </div>
    <div class="container-card">
      <Table :dataSource="filteredUsers" :columns="columns">
        <template #avatar="{ record }">
          <div class="data-avatar">
            <img :src="record.avatar.url" alt="" />
          </div>
        </template>
        <template #status="{ record }">
          <div
            class="data-status"
            v-html="getStatusText(record.isVerified)"
          ></div>
        </template>
        <template #created_at="{ record }">
          {{ new Date(record.created_at).toLocaleDateString() }}
        </template>
        <template #updated_at="{ record }">
          {{ new Date(record.updated_at).toLocaleDateString() }}
        </template>
        <template #action="{ record }">
          <span>
            <a class="btn">Update</a>
            <a class="btn">Delete</a>
          </span>
        </template>
      </Table>
      <!-- </div> -->
    </div>
  </div>
</template>
<script setup lang="ts">
import { ref, computed, onBeforeMount } from "vue";
import { useRouter } from "vue-router";
import UserCard from "../UserCard/index.vue";
import { ElNotification } from "element-plus";
import { getInfoCompanyAll } from "@/services/user.service";
import type { IUser } from "@/types/user";
import { Table, Divider } from "ant-design-vue";

const router = useRouter();
const tableColumns = ref([
  "Avatar",
  "Name",
  "Email",
  "role",
  "CreateAt",
  "UpdateAt",
  "Action",
]);
const columns = ref<Array<any>>([
  {
    title: "Avatar",
    key: "avatar",
    slots: { customRender: "avatar" },
  },
  {
    title: "Name",
    dataIndex: "name",
    key: "name",
  },
  {
    title: "Email",
    dataIndex: "email",
    key: "email",
  },
  {
    title: "role",
    dataIndex: "role",
    key: "role",
  },
  {
    title: "status",
    dataIndex: "status",
    slots: { customRender: "status" },
  },
  {
    title: "Created At",
    key: "created_at",
    slots: { customRender: "created_at" },
  },
  {
    title: "Updated At",
    key: "updated_at",
    slots: { customRender: "updated_at" },
  },
  {
    title: "Action",
    key: "action",
    slots: { customRender: "action" },
  },
]);
const listUser = ref<Array<IUser>>([]);
const getListUser = async (): Promise<void> => {
  try {
    const res = await getInfoCompanyAll();
    listUser.value = res.data;
  } catch (error) {
    console.log("error", error);
  }
};
const getStatusText = (isVerified: boolean) => {
  return isVerified
    ? '<span class="verified">Verified</span>'
    : '<span class="not-verified">Not verified</span>';
};
onBeforeMount(() => {
  getListUser();
});
const keySearch = ref<string>("");
const pageSize = ref(8);
const currentPage = ref(1);

const filteredUsers = computed(() => {
  const start = (currentPage.value - 1) * pageSize.value;
  const end = start + pageSize.value;
  return listUser.value
    .slice(start, end)
    .filter(
      (user) =>
        user.email.toLowerCase().includes(keySearch.value.toLowerCase()) ||
        user.name.toLowerCase().includes(keySearch.value.toLowerCase()) ||
        user.created_at.toLowerCase().includes(keySearch.value.toLowerCase()) ||
        user.updated_at.toLowerCase().includes(keySearch.value.toLowerCase())
    );
});
const handlePageChange = (page: number) => {
  currentPage.value = page;
};
</script>
<style lang="scss" scoped>
.container-list {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
}
.input-search {
  display: flex;
  justify-content: center;
  align-items: center;
}
.container-card {
  width: 100%;
  height: 100%;
  display: grid;
  font-size: 14px;
}
.row-title-card table {
  display: grid;
  grid-template-columns: auto auto auto auto auto auto 100px;
  align-items: center;
  background-color: #f2f3f4;
  padding: 15px;
  border-radius: 16px;
}
.container-search {
  display: flex;
  justify-content: space-between;
  margin-bottom: 50px;
  gap: 30px;
  margin-top: 20px;
  margin-left: 20px;
}
.container-left {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 20px;
}
.input-search {
  position: relative;
  border: 1px solid #b7b8bb;
  border-radius: 6px;
  padding: 7px 10px 7px 30px;
}
.input-search input {
  width: 100%;
  border: none;
  outline: none;
  background: transparent;
}
.input-search .icon-search {
  position: absolute;
  width: 24px;
  height: 24px;
  left: 0;
}
.button-create button {
  padding: 10px;
  border-radius: 16px;
  border: none;
  cursor: pointer;
}
.pagination {
  display: flex;
  justify-content: right;
}
.data-avatar img {
  width: 30px;
  height: 30px;
  border-radius: 50%;
}
.data-status {
  display: block;
  &.verified {
    border: green;
    background-color: #b7b8bb;
    color: green;
  }
  &.not-verified {
    border: red;
    background-color: #b7b8bb;
    color: red;
  }
}
a.btn {
  padding: 6px 8px;
  border: 1px solid #e0e0e0;
  margin: 0 4px;
  border-radius: 5px;
  &:hover {
    background-color: #e0e0e0;
  }
}
</style>
