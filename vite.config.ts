import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': '/themes/mercury/src/js',
    },
  },
  server: {
    host: true,
    cors: true,
    allowedHosts: ['.ddev.site'],
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


