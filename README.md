# @nomadle/rescript-bindings

Monorepo for ReScript bindings used by Nomadle.

## Packages

### i18next Ecosystem

| Package | Description | Peer Dependencies |
|---------|-------------|-------------------|
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-i18next.svg)](https://www.npmjs.com/package/@nomadle/rescript-i18next) [`@nomadle/rescript-i18next`](./packages/rescript-i18next) | i18next core | i18next |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-i18next-http-backend.svg)](https://www.npmjs.com/package/@nomadle/rescript-i18next-http-backend) [`@nomadle/rescript-i18next-http-backend`](./packages/rescript-i18next-http-backend) | HTTP backend plugin | i18next, i18next-http-backend |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-i18next-browser-languagedetector.svg)](https://www.npmjs.com/package/@nomadle/rescript-i18next-browser-languagedetector) [`@nomadle/rescript-i18next-browser-languagedetector`](./packages/rescript-i18next-browser-languagedetector) | Browser language detection | i18next, i18next-browser-languagedetector |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-react-i18next.svg)](https://www.npmjs.com/package/@nomadle/rescript-react-i18next) [`@nomadle/rescript-react-i18next`](./packages/rescript-react-i18next) | React integration | react-i18next |

### React Helmet

| Package | Description | Peer Dependencies |
|---------|-------------|-------------------|
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-react-helmet.svg)](https://www.npmjs.com/package/@nomadle/rescript-react-helmet) [`@nomadle/rescript-react-helmet`](./packages/rescript-react-helmet) | react-helmet | react-helmet |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-react-helmet-async.svg)](https://www.npmjs.com/package/@nomadle/rescript-react-helmet-async) [`@nomadle/rescript-react-helmet-async`](./packages/rescript-react-helmet-async) | react-helmet-async (SSR) | react-helmet-async |

### Fastify Ecosystem

| Package | Description | Peer Dependencies |
|---------|-------------|-------------------|
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-fastify.svg)](https://www.npmjs.com/package/@nomadle/rescript-fastify) [`@nomadle/rescript-fastify`](./packages/rescript-fastify) | Fastify core | fastify |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-fastify-cors.svg)](https://www.npmjs.com/package/@nomadle/rescript-fastify-cors) [`@nomadle/rescript-fastify-cors`](./packages/rescript-fastify-cors) | CORS plugin | @fastify/cors |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-fastify-jwt.svg)](https://www.npmjs.com/package/@nomadle/rescript-fastify-jwt) [`@nomadle/rescript-fastify-jwt`](./packages/rescript-fastify-jwt) | JWT plugin | @fastify/jwt |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-fastify-rate-limit.svg)](https://www.npmjs.com/package/@nomadle/rescript-fastify-rate-limit) [`@nomadle/rescript-fastify-rate-limit`](./packages/rescript-fastify-rate-limit) | Rate limiting | @fastify/rate-limit |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-fastify-static.svg)](https://www.npmjs.com/package/@nomadle/rescript-fastify-static) [`@nomadle/rescript-fastify-static`](./packages/rescript-fastify-static) | Static file serving | @fastify/static |

### Other Frontend

| Package | Description | Peer Dependencies |
|---------|-------------|-------------------|
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-supabase.svg)](https://www.npmjs.com/package/@nomadle/rescript-supabase) [`@nomadle/rescript-supabase`](./packages/supabase) | Supabase JS Client | @supabase/supabase-js |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-headlessui.svg)](https://www.npmjs.com/package/@nomadle/rescript-headlessui) [`@nomadle/rescript-headlessui`](./packages/headlessui) | Headless UI components | @headlessui/react |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-leaflet.svg)](https://www.npmjs.com/package/@nomadle/rescript-leaflet) [`@nomadle/rescript-leaflet`](./packages/leaflet) | Leaflet maps | leaflet, react-leaflet |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-pixi.svg)](https://www.npmjs.com/package/@nomadle/rescript-pixi) [`@nomadle/rescript-pixi`](./packages/pixi) | Pixi.js graphics | pixi.js, @pixi/react |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-react-select.svg)](https://www.npmjs.com/package/@nomadle/rescript-react-select) [`@nomadle/rescript-react-select`](./packages/react-select) | React Select | react-select |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-avatar-editor.svg)](https://www.npmjs.com/package/@nomadle/rescript-avatar-editor) [`@nomadle/rescript-avatar-editor`](./packages/avatar-editor) | Avatar image editor | react-avatar-editor |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-advertising.svg)](https://www.npmjs.com/package/@nomadle/rescript-advertising) [`@nomadle/rescript-advertising`](./packages/advertising) | Advertising slots | react-advertising |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-world-map.svg)](https://www.npmjs.com/package/@nomadle/rescript-world-map) [`@nomadle/rescript-world-map`](./packages/world-map) | SVG world map | react-world-map |

### Other Backend

| Package | Description | Peer Dependencies |
|---------|-------------|-------------------|
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-mongoose.svg)](https://www.npmjs.com/package/@nomadle/rescript-mongoose) [`@nomadle/rescript-mongoose`](./packages/mongoose) | MongoDB ODM | mongoose |
| [![npm](https://img.shields.io/npm/v/@nomadle/rescript-fuse.svg)](https://www.npmjs.com/package/@nomadle/rescript-fuse) [`@nomadle/rescript-fuse`](./packages/fuse) | Fuzzy search | fuse.js |

## Development

### Prerequisites

- [Volta](https://volta.sh/) - Node.js and pnpm version manager

### Setup

```bash
# Install dependencies
pnpm install

# Build all packages
pnpm build

# Run tests
pnpm test

# Clean build artifacts
pnpm clean
```

### Adding a new package

```bash
mkdir packages/rescript-<name>
cd packages/rescript-<name>
# Create package.json, rescript.json, vitest.config.ts, README.md
```

## Publishing

This repo uses [Changesets](https://github.com/changesets/changesets) for versioning and publishing.

```bash
# Add a changeset
pnpm changeset

# Version packages
pnpm version-packages

# Publish to npm
pnpm publish-packages
```

## License

MIT
