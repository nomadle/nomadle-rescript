import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    globals: true,
    include: ['lib/es6/tests/**/*_test.bs.js'],
    exclude: ['node_modules', 'lib/bs'],
  },
});
