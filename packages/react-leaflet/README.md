# @nomadle/rescript-react-leaflet

ReScript bindings for [React-Leaflet](https://react-leaflet.js.org/).

## Installation

```bash
npm install @nomadle/rescript-react-leaflet
```

Requires `@nomadle/rescript-leaflet` as a peer dependency:

```bash
npm install @nomadle/rescript-leaflet
```

## Usage

Add `@nomadle/rescript-leaflet` and `@nomadle/rescript-react-leaflet` to your `bs-dependencies` in `rescript.json`:

```json
{
  "bs-dependencies": [
    "@rescript/react",
    "@nomadle/rescript-leaflet",
    "@nomadle/rescript-react-leaflet"
  ]
}
```

## Example

```rescript
open ReactLeaflet
open Leaflet

let mapElement = <MapContainer
  center=(51.505, -0.09)
  zoom=13
  style={ReactDOM.Style.make(~width="100%", ~height="500px", ())}
>
  <TileLayer
    url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
    attribution="&copy; OpenStreetMap contributors"
  />
  <Marker position=(51.505, -0.09) />
</MapContainer>
```

## API

### Components

- `MapContainer` - Main map component
- `TileLayer` - Tile map layer
- `Marker` - Marker component
- `Popup` - Popup component
- `Tooltip` - Tooltip component
- `Circle`, `CircleMarker`, `Rectangle` - Shape components
- `Polyline`, `Polygon` - Line/polygon components
- `LayerGroup`, `FeatureGroup` - Layer containers
- `WMSTileLayer`, `ImageOverlay` - Additional layer types
- `GeoJSON` - GeoJSON layer
- `ScaleControl`, `ZoomControl`, `AttributionControl` - Map controls

### Hooks

- `Hooks.useMap()` - Get the Leaflet map instance
- `Hooks.useMapEvents(MapEvents.t)` - Subscribe to map events
- `Hooks.useMapEvent(string, handler)` - Subscribe to a single event type

### Types

- `Leaflet.position` - Tuple of (lat, lng)
- `Leaflet.bounds` - Array of positions
- `PathOptions.t` - Path styling options
- `EventHandlers.t` - Event handler object
- `MapEvents.t` - Map event handler object