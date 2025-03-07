<script setup lang="ts">
import { useAuthStore } from "@/stores/auth";
import { useRouter } from "vue-router";
import { ref } from "vue";
import { ISignUp } from "@/types/user";
import { registerCompanyApi } from "@/services/user.service";
import { ElNotification } from "element-plus";
import { regex } from "@/utils";
const auth = useAuthStore();
const router = useRouter();

const user = ref<ISignUp>({
  email: "",
  name: "",
  password: "",
  avatar: "",
  age: 0,
});
const isEnterValue = ref<boolean[]>([false]);
const isMatchPassword = ref<boolean>(false);
const rePassword = ref<string>("");

const signUp = async () => {
  try {
    if (!checkInput()) {
      return;
    }
    if (rePassword.value != user.value.password) {
      isMatchPassword.value = true;
      return;
    }
    isMatchPassword.value = false;
    await registerCompanyApi(user.value);
    ElNotification({
      title: "Success",
      message: "Create user successfully!",
      type: "success",
      offset: 60,
    });
    router.push("/login");
  } catch (error: any) {
    ElNotification({
      title: "Error",
      message: error.response.data.message,
      type: "error",
      offset: 60,
    });
    console.error(error);
  }
};

const checkInput: () => boolean = () => {
  isEnterValue.value[0] = !user.value.email;
  isEnterValue.value[1] = !user.value.name;
  isEnterValue.value[2] = !user.value.password;
  isEnterValue.value[3] = !rePassword.value;
  if (user.value.email) {
    isEnterValue.value[4] = !regex.email.test(user.value.email);
  }
  if (user.value.password) {
    isEnterValue.value[5] = !(user.value.password.length >= 8);
  }
  return !isEnterValue.value.some((value) => value === true);
};
</script>

<template>
  <div class="login-container">
    <div class="login-container__form">
      <h1 class="login-container__form__title">Sign up as Employer</h1>
      <div class="login-container__form__content">
        <div>
          <el-input
            v-model="user.email"
            validate-event
            type="email"
            placeholder="Your Email"
            class="login-container__form__content__input"
          />
          <span
            class="login-container__form__content__error"
            v-show="isEnterValue[0]"
            >Please enter your email</span
          >
          <span
            class="login-container__form__content__error"
            v-show="isEnterValue[4]"
            >Your email is invalid</span
          >
        </div>
        <div>
          <el-input
            v-model="user.name"
            placeholder="Your name"
            class="login-container__form__content__input"
          />
          <span
            class="login-container__form__content__error"
            v-show="isEnterValue[1]"
            >Please enter your name</span
          >
        </div>
        <div>
          <el-input
            v-model="user.password"
            type="password"
            placeholder="Your password"
            show-password
            class="login-container__form__content__input"
          />
          <span
            class="login-container__form__content__error"
            v-show="isEnterValue[2]"
            >Please enter your password</span
          >
          <span
            class="login-container__form__content__error"
            v-show="isEnterValue[5]"
            >Password must be at least 8 characters long</span
          >
        </div>
        <div>
          <el-input
            v-model="rePassword"
            type="password"
            placeholder="Confirm Your password"
            show-password
            class="login-container__form__content__input"
          />
          <span
            class="login-container__form__content__error"
            v-show="isEnterValue[3]"
            >Please enter your confirm password</span
          >
        </div>
        <span
          class="login-container__form__content__error"
          v-show="isMatchPassword"
          >The entered passwords do not match. Try again.</span
        >
        <el-button
          @click="signUp"
          class="login-container__form__content__submit"
          type="primary"
          >Sign up</el-button
        >
        <div class="login-container__form__content__login">
          <span>Already have an account?</span>
          <el-link type="primary" href="/login">Sign in</el-link>
        </div>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.login-container {
  width: 100%;
  height: 100%;
  overflow: hidden;
  &__form {
    width: 40%;
    margin: auto;
    margin-top: 100px;
    background: #fff;
    padding: 40px 20px 60px;
    box-shadow: $shadow-primary;
    border-radius: 12px;
    &__title {
      font-weight: 700;
      font-size: 1.5rem;
      line-height: 2rem;
      margin-bottom: 2rem;
      text-align: center;
    }
    &__content {
      padding: 0 30px;
      display: flex;
      flex-direction: column;
      gap: 20px;
      &__co {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
      }
      &__input,
      &__submit {
        width: 100%;
      }
      &__login {
        span {
          font-size: 12px;
          padding-right: 8px;
        }
      }
      &__error {
        font-size: 12px;
        color: red;
      }
    }
  }
}
</style>
