<script setup lang="ts">
import { onMounted, ref, watch } from "vue";
import { useRouter } from "vue-router";
import { useAuthStore } from "../stores/auth";

defineProps<{}>();
const router = useRouter();
const authStore = useAuthStore();

const goToLogin: () => void = () => {
  router.push("/login");
};
const goToHome: () => void = () => {
  router.push("/");
};
const goToJob: () => void = () => {
  router.push("/mainjob");
};
const goToUser: () => void = () => {
  router.push("/user");
};
const goToRegisterCompany: () => void = () => {
  router.push("/register-company");
};
const goToRegister: () => void = () => {
  router.push("/register");
};
const isLogin = ref<boolean | undefined>(false);

const logout: () => Promise<void> = async () => {
  try {
    localStorage.removeItem("access_token");
    localStorage.removeItem("refresh_token");
    authStore.setAuthStore({
      user: {
        email: "",
        password: "",
      },
      isLoggedIn: false,
      isAdmin: false,
      isCompany: false,
    });
    router.push("/login");
  } catch (error) {
    console.error(error);
  }
};
isLogin.value = authStore.getIsLoggedIn();
</script>

<template>
  <div class="nav-container">
    <div class="nav-container__body">
      <div class="header-container">
        <a class="logo-job" href="/home">
          <img src="../images/logoFE.png" alt="Việc làm" />
        </a>
        <span class="navigate">JOBS</span>
        <span class="navigate">COMPANIES</span>
        <span class="navigate" @click="goToJob()">NEWS</span>
      </div>
      <div
        class="nav-container__body__action"
        v-if="!authStore.getIsLoggedIn()"
      >
        <el-button
          class="nav-container__body__action__register"
          type="primary"
          @click="goToRegister"
          plain
          >Register</el-button
        >
        <el-button
          class="nav-container__body__action__login"
          type="primary"
          @click="goToLogin"
          >Login</el-button
        >
        <el-button class="nav-container__body__action__employer" plain>
          For Employer
          <div class="dropdown-content__employer">
            <a class="dropdown-content__employer__item" @click="goToLogin()"
              >Login</a
            >
            <a
              class="dropdown-content__employer__item"
              @click="goToRegisterCompany()"
              >Register for Hiring</a
            >
            <!-- <a class="dropdown-content__employer__item" @click="logout()">Đăng xuất</a> -->
          </div>
        </el-button>
      </div>
      <div class="nav-container__body__info" v-else>
        <div class="avatar-flex" @click="goToUser()">
          <img :src="authStore.getAvatar()" alt="avatar" />
          <p>{{ authStore.getUserName() }}</p>
        </div>
        <div class="dropdown">
          <button class="dropbtn">
            Menu <el-icon><CaretBottom /></el-icon>
          </button>
          <div class="dropdown-content">
            <a @click="goToJob()">Việc làm</a>
            <a @click="goToUser()">Tài khoản</a>
            <a @click="logout()">Đăng xuất</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.nav-container {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 56px;
  display: flex;
  justify-content: center;
  border-bottom: 1px solid #ebeef5;
  background-color: #483aa0;
  z-index: 9999;
  &__body {
    width: 100%;
    max-width: 1440px;
    padding: 0 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-right: 20px;
    .header-container {
      display: flex;
      justify-content: center;
      .navigate {
        color: #ffffff;
        text-align: center;
        height: 55px;
        margin-left: 6px;
        line-height: 55px;
        width: 90px;
        display: block;
        cursor: pointer;
        &:hover {
          background-color: #292069;
        }
      }
    }
    &__logo {
      font-size: 1.5rem;
      font-weight: 700;
      // @include gradient-text;
      color: $color-danger;
    }

    &__action {
      display: flex;
    }
    &__info {
      display: flex;
      align-items: center;
      gap: 5px;
      &__icon-right {
        cursor: pointer;
        &:hover {
          transform: translateX(10px);
          transition: all 0.2s linear;
        }
      }
    }
  }
}
.menu-main {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  cursor: pointer;
  font-size: 12px;
  background-color: #483aa0;
  color: white;
  padding: 19px;
}
.menu-main:hover {
  background-color: #292069;
}
.menu-main span {
  padding-right: 4px;
}
.logo-job img {
  width: 150px;
  height: 50px;
}
.nav-container__body__info img {
  width: 30px;
  height: 30px;
  border-radius: 50%;
}
.nav-container__body__info p {
  font-size: 12px;
  color: white;
}
.avatar-flex {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 5px;
  padding: 12px 5px;
  cursor: pointer;
}
.avatar-flex:hover {
  background-color: #292069;
  text-align: center;
}
.dropbtn {
  background-color: #483aa0;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
  font-size: 12px;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 4px;
}
.dropbtn:hover {
  background-color: #292069;
}

.dropdown {
  position: relative;
  display: inline-block;
  font-size: 12px;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  top: 95%;
  min-width: 100px;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  cursor: pointer;
  z-index: 9999;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {
  background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
  z-index: 9999;
  display: block;
}
.nav-container__body__action__employer {
  position: relative;
}
.nav-container__body__action__employer:hover .dropdown-content__employer {
  display: flex;
  color: #3e3f41;
}
.dropdown-content__employer {
  position: absolute;
  width: 150px;
  background-color: #ffffff;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
  display: none;
  flex-direction: column;
  top: 35px;
  right: -20px;
  &::before {
    content: "";
    width: 150px;
    height: 5px;
    position: absolute;
    top: -4px;
    background-color: transparent;
  }
}
.dropdown-content__employer__item {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 30px;
  &:hover {
    color: #409eff;
    background-color: #c4c8d0;
  }
}
</style>
