import { createRouter, createWebHistory } from "vue-router";
import { useAuthStore } from "@/stores/auth";
import {jwtDecode} from 'jwt-decode';

const isAdmin = (to: any, from: any, next: any) => {
    // const roles: boolean = useAuthStore().getIsAdmin();
    const access_token  = localStorage.getItem("access_token") as string
    const decodedToken = jwtDecode(access_token) as { role: string };
    const roles = decodedToken.role;
    if (roles == "admin") {
      next();
    } else {
      next('/403');
    }
  };
const isCompany = (to: any, from: any, next: any) => {
    // const roles: boolean = useAuthStore().getIsAdmin();
    const access_token  = localStorage.getItem("access_token") as string
    const decodedToken = jwtDecode(access_token) as { role: string };
    const roles = decodedToken.role;
    if (roles == "company") {
      next();
    } else {
      next('/403');
    }
  };
const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: "/",
      redirect: "/mainjob",
    },
    {
      path: "/mainjob",
      component: () => import("@/views/mainjob/index.vue"),
      meta: {
        layout: "default",
      },
    },
    {
      path: "/login",
      component: () => import("@/views/login/index.vue"),
    },
    {
      path: "/register",
      component: () => import("@/views/register/index.vue"),
    },
    {
      path: "/register-company",
      component: () => import("@/views/register-company/index.vue"),
    },
    {
      path: "/dashboard",
      component: () => import("@/views/dashboard/index.vue"),
      meta: {
        layout: "default",
      },
      beforeEnter: isAdmin,
    },
    {
      path: "/dashboard-company",
      component: () => import("@/views/dashboard-company/index.vue"),
      meta: {
        layout: "default",
      },
      beforeEnter: isCompany,
    },
    {
      path: "/mainjob/:id",
      name: "JobDetail",
      component: () => import("@/views/jobdetails/index.vue"),
      props: true,
    },
    {
      path: "/user",
      component: () => import("@/views/user/index.vue"),
      meta: {
        layout: "default",
      },
    },
    {
      path: "/company",
      component: () => import("@/views/company/index.vue"),
      meta: {
        layout: "default",
      },
    },
    {
      path: "/forgotpassword",
      component: () => import("@/views/forgotpassword/index.vue"),
      meta: {
        layout: "default",
      },
    },
    {
      path: "/resetpassword",
      component: () => import("@/views/resetpassword/index.vue"),
      meta: {
        layout: "default",
      },
    },
    {
        path: '/403',
        name: 'Error403',
        component: () => import('@/views/error/index.vue'),
        meta: {
          layout: 'default',
        },
      },
  ],
});

export default router;
