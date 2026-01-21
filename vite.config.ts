import { defineConfig } from 'vite';
import { resolve } from 'path';

export default defineConfig(({ command }) => ({
  resolve: {
    alias: {
      '@': resolve(__dirname, 'themes/mercury/src/js'),
    },
  },
  server: {
    host: true,
    cors: true,
    port: 5170,
    allowedHosts: [
      'mercury.ddev.site'
    ],
  },
  base: command === 'build' ? '/_resources/themes/mercury/dist/build/' : undefined,
  build: {
    manifest: true,
    emptyOutDir: true,
    outDir: resolve(__dirname, 'themes/mercury/dist/build'),
    sourcemap: true,
    copyPublicDir: false,
    rollupOptions: {
      input: {
        main: resolve(__dirname, 'themes/mercury/src/js/main.js'),
        extended: resolve(__dirname, 'themes/mercury/src/js/extended.js'),
      },
      output: {
        format: 'es',
      },
    },
  },
}));