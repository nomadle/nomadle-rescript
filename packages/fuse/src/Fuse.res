/**
 * Fuse.js FFI bindings for fuzzy search
 * Used for country name matching in visa search
 */

// Country data type from iso-3166-1
type countryData = {
  country: string,
  alpha2: string,
  alpha3: string,
}

// Fuse.js search result
type fuseResult<'item> = {
  item: 'item,
  refIndex: int,
  score: option<float>,
}

// Fuse.js options
type fuseOptions = {
  keys: array<string>,
  threshold: float,
}

// Fuse.js class external
@module("fuse.js") @new
external make: (array<'a>, fuseOptions) => 'fuse = "default"

// Search method
@send
external search: ('fuse, string) => array<fuseResult<'a>> = "search"
