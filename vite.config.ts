import { defineConfig } from 'vite';

export default defineConfig({
  css: {
    preprocessorOptions: {
      scss: {
        api: 'modern-compiler',
      }
    }
  },
  resolve: {
    alias: {
      '@': '/themes/mercury/src/js',
    },
  },
  server: {
    host: true,
  },
  build: {
    manifest: true,
    emptyOutDir: true,
    outDir: './themes/mercury/dist/build',
    sourcemap: true,
    copyPublicDir: false,
    rollupOptions: {
      input: {
        main: './themes/mercury/src/js/main.js',
        extended: './themes/mercury/src/js/extended.js',
      },
      output: {
        format: 'es',
      },
    },
  },
});


