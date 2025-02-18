import { defineConfig } from "vite"
import vue from "@vitejs/plugin-vue"
import path from "path"

// ant design
// import { AntDesignVueResolver } from "unplugin-vue-components/resolvers"
import Components from "unplugin-vue-components/vite"

// https://vitejs.dev/config/
export default defineConfig({
    resolve: {
        alias: {
            "@": path.resolve(__dirname, "./src"),
        },
    },
    plugins: [
        vue(),
        Components({
            resolvers: [
                // AntDesignVueResolver({
                //     importStyle: false, // css in js
                // }),
            ],
        }),
    ],
    css: {
        preprocessorOptions: {
            less: {
                javascriptEnabled: true,
                additionalData: "@root-entry-name: default;",
            },
            scss: {
                additionalData: `
                  @import "./src/assets/css/mixins.scss"; 
                  @import "./src/assets/css/_variables.scss";
                  `,
            },
        },
    },
})
