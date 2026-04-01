import { defineConfig } from 'vitest/config';
import path from 'path';

const rootDir = path.resolve(__dirname, '../../');

export default defineConfig({
  root: rootDir,
  test: {
    environment: 'jsdom',
    globals: true,
    include: ['packages/react-leaflet/lib/es6/tests/**/*_test.bs.js'],
    exclude: ['node_modules', '**/lib/bs/**', '**/lib/ocaml/**'],
  },
  resolve: {
    alias: {
      '@nomadle/rescript-leaflet/lib/es6/src/Leaflet.bs.js': path.join(rootDir, 'packages/leaflet/lib/es6/src/Leaflet.bs.js'),
      'rescript-vitest/lib/es6/src': path.join(rootDir, 'node_modules/rescript-vitest/lib/es6/src'),
    },
  },
});