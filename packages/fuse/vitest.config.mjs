import { defineConfig } from 'vitest/config';
import path from 'path';

export default defineConfig({
  test: {
    environment: 'node',
    globals: true,
    include: ['lib/es6/tests/**/*_test.bs.js'],
    exclude: ['node_modules', 'lib/bs'],
  },
  resolve: {
    alias: {
      '@nomadle/rescript-fuse': path.resolve(__dirname, './src'),
      'rescript-vitest/lib/es6/src': path.resolve(__dirname, '../../node_modules/rescript-vitest/lib/es6/src'),
    },
  },
});
