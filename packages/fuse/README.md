# @nomadle/rescript-fuse

ReScript bindings for [Fuse.js](https://www.fusejs.io/) - a lightweight fuzzy-search library.

## Features

- ✅ Type-safe fuzzy search bindings
- ✅ Configurable search options (keys, threshold)
- ✅ Generic support for any data type
- ✅ Zero runtime overhead

## Installation

```bash
npm install @nomadle/rescript-fuse fuse.js
# or
pnpm add @nomadle/rescript-fuse fuse.js
```

Add to your `rescript.json`:

```json
{
  "bs-dependencies": ["@nomadle/rescript-fuse"]
}
```

## Usage

### Basic Search

```rescript
open Fuse

// Define your data type
type book = {
  title: string,
  author: string,
}

// Create data array
let books = [
  {title: "The Great Gatsby", author: "F. Scott Fitzgerald"},
  {title: "To Kill a Mockingbird", author: "Harper Lee"},
]

// Create Fuse instance with options
let fuse = make(books, {
  keys: ["title", "author"],
  threshold: 0.4,
})

// Search
let results = fuse->search("gatsby")
// results: array<{item: book, refIndex: int, score: float}>
```

### Country Matching Example

```rescript
open Fuse

type country = {
  name: string,
  code: string,
}

let countries = [
  {name: "United States", code: "US"},
  {name: "United Kingdom", code: "UK"},
]

let fuse = make(countries, {
  keys: ["name"],
  threshold: 0.3,
})

let matches = fuse->search("united")
```

## API

### `make(array<'a>, fuseOptions) => 'fuse`

Creates a new Fuse instance.

### `fuseOptions`

```rescript
type fuseOptions = {
  keys: array<string>,
  threshold: float, // 0.0 = exact match, 1.0 = match anything
}
```

### `search('fuse, string) => array<fuseResult<'a>>`

Performs a fuzzy search and returns matching results.

```rescript
type fuseResult<'item> = {
  item: 'item,
  refIndex: int,
  score: float, // 0.0 = perfect match, 1.0 = worst match
}
```

## License

MIT
