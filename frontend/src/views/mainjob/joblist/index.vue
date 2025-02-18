<template>
  <div class="container-listjob">
    <div class="card-listjob" @click="toJobDetail(job?.id)">
      <div class="img-card">
        <img
          v-if="job.images && job.images[0]"
          :src="job.images && job.images[0]?.src"
          :alt="job.images && job.images[0]?.description"
          :key="job.images && job.images[0]?.src"
        />
        <img
          v-else
          src="https://easy.jobs/wp-content/uploads/2021/07/Top-10-Recruitment-Methods-To-Find-The-Right-Candidate.png"
          alt="#default preview"
        />
      </div>
      <div class="text-card">
        <h3>{{ job?.title || "No Title" }}</h3>
        <p class="company">{{ job?.company || "No Company" }}</p>
        <p class="location">{{ job?.place || "No Location" }}</p>
        <span class="salary">{{ job?.salary || "No Salary" }} |</span>
        <span>{{ job?.level || "No Level" }}</span>
      </div>
    </div>
    <div class="button-edit" v-if="isAdmin">
      <button @click="handleOpenPopup(job?.id)">Edit</button>
    </div>
    <popupUpdate
      v-if="isOpen"
      @close-popup="handleClosePopup"
      :idChoose="idChooseUpdate"
    />
  </div>
</template>
<script setup lang="ts">
import type { IJob } from "@/types/auth";
import { useRouter } from "vue-router";
import { ref, onMounted } from "vue";
import { useAuthStore } from "@/stores/auth";
import popupUpdate from "@/views/popup/popupUpdate.vue";

const props = defineProps<{
  job: IJob;
}>();
onMounted(() => {
  handleCheckAuth();
});
const isOpen = ref<boolean>(false);
const idChooseUpdate = ref();
const handleImageError = (image: any) => {
  console.log(image);
  image.src = "src/images/left-img-1.webp";
};
const handleOpenPopup = (id: Number) => {
  isOpen.value = true;
  idChooseUpdate.value = id;
};
const handleClosePopup = () => {
  isOpen.value = false;
  idChooseUpdate.value = "";
};
const router = useRouter();
const toJobDetail = (idChoose: Number) => {
  router.push(`/mainjob/${idChoose}`);
};
const auth = useAuthStore();
const isAdmin = ref<boolean>(false);
const handleCheckAuth = () => {
  isAdmin.value = auth.getIsAdmin();
  return false;
};
</script>
<style scoped>
.img-card img {
  width: 80px;
  height: 80px;
}
.img-card {
  float: left;
}
.card-listjob {
  display: grid;
  grid-template-columns: 100px 350px;
  gap: 50px;
  background-color: #f5fcfe;
  padding: 30px 15px;
  border-radius: 15px;
  border: 1px solid rgb(2, 105, 219, 0.2);
  cursor: pointer;
  z-index: 1;
}
.card-listjob:hover {
  transition: all 0.5s ease;
  box-shadow: 5px 5px 5px 0px rgb(2, 105, 219, 0.5);
}
.container-listjob {
  padding: 8px;
  display: grid;
  height: 200px;
  grid-template-columns: auto auto;
}
.text-card .company {
  color: #343a40;
  font-size: 14px;
  padding-top: 3px;
}
.text-card h3 {
  white-space: nowrap; /* Ngăn chặn việc quấn dòng */
  overflow: hidden; /* Ẩn phần văn bản vượt ra ngoài kích thước của phần tử cha */
  text-overflow: ellipsis; /* Hiển thị dấu ".." khi văn bản quá dài */
}
.text-card .location {
  color: #9aa3ac;
  font-size: 12px;
  padding-top: 3px;
}
.text-card span {
  color: #343a40;
  font-size: 12px;
  padding-top: 3px;
}
.salary {
  color: #4a9bef !important;
  font-weight: 600;
}
.button-edit {
  display: flex;
  justify-content: center;
  align-items: center;
}
.button-edit button {
  padding: 5px 20px;
  border: none;
  background-color: #4a9bef;
  color: white;
  border-radius: 16px;
  cursor: pointer;
  transition: all 0.3 ease-in-out;
}
.button-edit button:hover {
  background-color: #175597;
}
</style>
