[![npm](https://img.shields.io/npm/v/@nomadle/rescript-leaflet.svg)](https://www.npmjs.com/package/@nomadle/rescript-leaflet)

# @nomadle/rescript-leaflet

ReScript bindings for [Leaflet](https://leafletjs.com/) - the leading open-source JavaScript library for mobile-friendly interactive maps.

## Installation

```bash
npm install @nomadle/rescript-leaflet
```

## Usage

Add `@nomadle/rescript-leaflet` to your `bs-dependencies` in `rescript.json`:

```json
{
  "bs-dependencies": [
    "@nomadle/rescript-leaflet"
  ]
}
```

Don't forget to include Leaflet CSS in your HTML:

```html
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
```

## API

### Types

- `position` - Tuple of (lat, lng) as `(float, float)`
- `bounds` - Array of positions `array<position>`
- `map` - Opaque type for Leaflet map instance

### LatLng

```rescript
let ll = LatLng.make(51.505, -0.09)
let lat = LatLng.lat(ll)
let lng = LatLng.lng(ll)
```

### LatLngBounds

```rescript
let bounds = LatLngBounds.make((51.5, -0.1), (51.51, -0.11))
let center = LatLngBounds.getCenter(bounds)
```

### Point

```rescript
let pt = Point.make(100.0, 200.0)
```

### Icon

```rescript
let icon = Icon.createDefault(~iconUrl="/marker.png", ())
let divIcon = Icon.createDivIcon(~html="<div>Marker</div>", ())
```

### PathOptions

```rescript
let opts = PathOptions.make(
  ~color="#ff0000",
  ~weight=3,
  ~opacity=1.0,
  ~fillColor="#ff6666",
  ~fillOpacity=0.5,
  ()
)
```

### EventTypes

Types for Leaflet event objects with accessors:
- `mouseEvent` - Mouse event with latlng, type, target
- `leafletEvent` - Base event type
- `leafletMouseEvent` - Mouse event with additional properties

### EventHandlers

```rescript
let handlers = EventHandlers.make(
  ~click=event => (),
  ~mouseover=event => (),
  ()
)
```

### Classes

- `Map` - Create and manipulate Leaflet maps
- `TileLayer` - Tile layers
- `Marker` - Markers
- `Circle`, `CircleMarker` - Circle shapes
- `Polyline`, `Polygon` - Line/polygon shapes
- `Rectangle` - Rectangle shape
- `ImageOverlay` - Image overlay
- `GeoJSON` - GeoJSON layer
- `LayerGroup`, `FeatureGroup` - Layer containers
- `Control`, `ScaleControl` - Map controls

Each class provides methods like `addTo`, `remove`, `setStyle`, etc.

## React-Leaflet

For React-Leaflet bindings, see [@nomadle/rescript-react-leaflet](/packages/react-leaflet).

## License

MIT
