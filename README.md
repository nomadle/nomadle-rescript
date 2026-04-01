# @nomadle/rescript-bindings

Monorepo for ReScript bindings used by Nomadle.

## Packages

### i18next Ecosystem

| Package | Description | Peer Dependencies |
|---------|-------------|-------------------|
| [`@nomadle/rescript-i18next`](./packages/rescript-i18next) | i18next core | i18next |
| [`@nomadle/rescript-i18next-http-backend`](./packages/rescript-i18next-http-backend) | HTTP backend plugin | i18next, i18next-http-backend |
| [`@nomadle/rescript-i18next-browser-languagedetector`](./packages/rescript-i18next-browser-languagedetector) | Browser language detection | i18next, i18next-browser-languagedetector |
| [`@nomadle/rescript-react-i18next`](./packages/rescript-react-i18next) | React integration | react-i18next |

### React Helmet

| Package | Description | Peer Dependencies |
|---------|-------------|-------------------|
| [`@nomadle/rescript-react-helmet`](./packages/rescript-react-helmet) | react-helmet | react-helmet |
| [`@nomadle/rescript-react-helmet-async`](./packages/rescript-react-helmet-async) | react-helmet-async (SSR) | react-helmet-async |

### Fastify Ecosystem

| Package | Description | Peer Dependencies |
|---------|-------------|-------------------|
| [`@nomadle/rescript-fastify`](./packages/rescript-fastify) | Fastify core | fastify |
| [`@nomadle/rescript-fastify-cors`](./packages/rescript-fastify-cors) | CORS plugin | @fastify/cors |
| [`@nomadle/rescript-fastify-jwt`](./packages/rescript-fastify-jwt) | JWT plugin | @fastify/jwt |
| [`@nomadle/rescript-fastify-rate-limit`](./packages/rescript-fastify-rate-limit) | Rate limiting | @fastify/rate-limit |
| [`@nomadle/rescript-fastify-static`](./packages/rescript-fastify-static) | Static file serving | @fastify/static |

### Other Frontend

| Package | Description | Peer Dependencies |
|---------|-------------|-------------------|
| [`@nomadle/rescript-supabase`](./packages/supabase) | Supabase JS Client | @supabase/supabase-js |
| [`@nomadle/rescript-headlessui`](./packages/headlessui) | Headless UI components | @headlessui/react |
| [`@nomadle/rescript-leaflet`](./packages/leaflet) | Leaflet maps | leaflet, react-leaflet |
| [`@nomadle/rescript-pixi`](./packages/pixi) | Pixi.js graphics | pixi.js, @pixi/react |
| [`@nomadle/rescript-react-select`](./packages/react-select) | React Select | react-select |
| [`@nomadle/rescript-avatar-editor`](./packages/avatar-editor) | Avatar image editor | react-avatar-editor |
| [`@nomadle/rescript-advertising`](./packages/advertising) | Advertising slots | react-advertising |
| [`@nomadle/rescript-world-map`](./packages/world-map) | SVG world map | react-world-map |

### Other Backend

| Package | Description | Peer Dependencies |
|---------|-------------|-------------------|
| [`@nomadle/rescript-mongoose`](./packages/mongoose) | MongoDB ODM | mongoose |
| [`@nomadle/rescript-fuse`](./packages/fuse) | Fuzzy search | fuse.js |

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
