import { defineConfig } from 'vite';
import path from 'path';

declare const __dirname: string;

export default defineConfig({
  plugins: [],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './themes/mercury/src/'),
    },
  },
  server: {
    https: false,
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
        index: './themes/mercury/src/js/main.js',
      },
    },
  },
});
