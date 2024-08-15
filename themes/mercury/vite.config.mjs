import { defineConfig } from 'vite'

export default defineConfig(({ command }) => {
  return {
    server: {
      host: '0.0.0.0',
      port: 3000,
    },
    base: './',
    build: {
      copyPublicDir: false,
      outDir: './themes/mercury/dist/build',
      manifest: true,
      sourcemap: true,
      rollupOptions: {
        input: {
          'main.js': './themes/mercury/src/js/main.js',
          'main.scss': './themes/mercury/src/styles/main.scss'
        },
        output: {
          entryFileNames: `[name]`,
          chunkFileNames: `[name]-[hash].js`,
          assetFileNames: `[name].[ext]`
        }
      },
    },
    plugins: []
  }
})
