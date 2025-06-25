// nuxt.config.ts
export default defineNuxtConfig({
    srcDir: 'src/',
    ssr: true,
    runtimeConfig: {
      public: {
        port: Number(process.env.NUXT_PORT) || 3000,
        express: Number(process.env.EXPRESS_PORT) || 4000
      }
    },
    devServer: {
      port: Number(process.env.NUXT_PORT) || 3000
    }
})
  