import { defineConfig } from 'vitest/config';
import path from 'path';

export default defineConfig({
  test: {
    environment: 'jsdom',
    globals: true,
    include: ['lib/es6/tests/**/*_test.bs.js'],
    exclude: ['node_modules', 'lib'],
  },
  resolve: {
    alias: {
      '@nomadle/rescript-react-helmet': path.resolve(__dirname, './src'),
    },
  },
});
