[![npm](https://img.shields.io/npm/v/@nomadle/rescript-world-map.svg)](https://www.npmjs.com/package/@nomadle/rescript-world-map)

# @nomadle/rescript-world-map

ReScript bindings for [react-world-map](https://github.com/scottsidwell/react-world-map) - a simple, interactive SVG world map component for React.

## Installation

```bash
npm install @nomadle/rescript-world-map react-world-map
# or
pnpm add @nomadle/rescript-world-map react-world-map
```

Add to your `rescript.json`:

```json
{
  "bs-dependencies": ["@nomadle/rescript-world-map"]
}
```

## Usage

### Basic Example

```rescript
open ReactWorldMap

@react.component
let make = () => {
  let (selected, setSelected) = React.useState(() => None)

  <WorldMap
    selected={selected}
    onSelect={continent => {
      let parsed = ReactWordMapTypes.continentFromString(continent)
      setSelected(_ => parsed)
    }}
  />
}
```

### With Continent Type Helpers

```rescript
open ReactWorldMap

@react.component
let make = () => {
  let (selected, setSelected) = React.useState(() => None)

  let handleSelect = continentString => {
    switch ReactWordMapTypes.continentFromString(continentString) {
    | Some(continent) => {
        setSelected(_ => Some(continent))
        Js.log("Selected: " ++ ReactWordMapTypes.continentToFullName(continent))
      }
    | None => Js.log("Unknown continent")
    }
  }

  let selectedCode = selected->Option.map(ReactWordMapTypes.continentToString)

  <div>
    <WorldMap selected={selectedCode} onSelect={handleSelect} />
    {selected
    ->Option.map(continent =>
      <p>{("Selected: " ++ ReactWordMapTypes.continentToFullName(continent))->React.string}</p>
    )
    ->Option.getOr(React.null)}
  </div>
}
```

### Multiple Selection Mode

```rescript
open ReactWorldMap

@react.component
let make = () => {
  <WorldMap
    multiple=true
    onSelect={continent => Js.log("Selected: " ++ continent)}
  />
}
```

## Props

These props mirror the underlying `react-world-map` API:

| Prop | Type | Description |
|------|------|-------------|
| `selected` | `string` | The currently selected continent code, e.g. `"na"` (optional) |
| `onSelect` | `string => unit` | Callback when a continent is clicked |
| `multiple` | `bool` | Allow multiple selections in uncontrolled mode (optional) |

> **Note:** The binding stays faithful to the original JS component. If you use a custom wrapper that accepts `selectedContinent`, `onHover`, `onMouseLeave`, or `className`, that logic belongs in your application layer, not in this binding.

## Continent Types

The `ReactWordMapTypes` module provides type-safe helpers for working with continent codes:

- `continent` - A polymorphic variant type for continents:
  - `#NorthAmerica` ("na")
  - `#SouthAmerica` ("sa")
  - `#Africa` ("af")
  - `#Europe` ("eu")
  - `#Asia` ("as")
  - `#Oceania` ("oc")

- `continentFromString(string)` - Parse a string to a continent option
- `continentToString(continent)` - Convert a continent to its code
- `continentToFullName(continent)` - Convert a continent to its full name

## License

MIT
