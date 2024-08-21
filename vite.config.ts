import { defineConfig } from 'vite';
import path from 'path';

declare const __dirname: string;

export default defineConfig({
  plugins: [],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './themes/mercury/src/js'),
    },
  },
  server: {
    host: true,
  },
  build: {
    manifest: true,
    emptyOutDir: false,
    outDir: './themes/mercury/dist/build/',
    sourcemap: true,
    copyPublicDir: false,
    rollupOptions: {
      input: {
        main: './themes/mercury/src/js/main.js',
        extended: './themes/mercury/src/js/extended.js',
      },
    },
  },
});
