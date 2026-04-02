module Leaflet_EventTypes = Leaflet.EventTypes

module EventHandlers = {
  type t

  @obj
  external make: (
    ~click: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~dblclick: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~mousedown: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~mouseup: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~mouseover: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~mouseout: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~mousemove: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~contextmenu: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~keypress: Leaflet_EventTypes.leafletEvent => unit=?,
    ~preclick: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    unit,
  ) => t = ""
}

module MapContainer = {
  @module("react-leaflet/MapContainer") @react.component
  external make: (
    ~center: Leaflet.position,
    ~zoom: int,
    ~style: ReactDOM.Style.t,
    ~scrollWheelZoom: bool=?,
    ~zoomControl: bool=?,
    ~attributionControl: bool=?,
    ~className: string=?,
    ~maxZoom: int=?,
    ~minZoom: int=?,
    ~zoomSnap: float=?,
    ~zoomDelta: float=?,
    ~worldCopyJump: bool=?,
    ~crs: string=?,
    ~preferCanvas: bool=?,
    ~centerImmutable: bool=?,
    ~children: React.element,
  ) => React.element = "MapContainer"
}

module LayerGroup = {
  @module("react-leaflet/LayerGroup") @react.component
  external make: (
    ~children: React.element,
    ~eventHandlers: EventHandlers.t=?,
  ) => React.element = "LayerGroup"
}

module FeatureGroup = {
  @module("react-leaflet/FeatureGroup") @react.component
  external make: (
    ~children: React.element,
    ~eventHandlers: EventHandlers.t=?,
  ) => React.element = "FeatureGroup"
}

module TileLayer = {
  @module("react-leaflet/TileLayer") @react.component
  external make: (
    ~url: string,
    ~attribution: string=?,
    ~maxZoom: int=?,
    ~minZoom: int=?,
    ~opacity: float=?,
    ~tileSize: int=?,
    ~subdomains: string=?,
    ~errorTileUrl: string=?,
    ~zoomOffset: int=?,
    ~zoomReverse: bool=?,
    ~detectRetina: bool=?,
    ~crossOrigin: string=?,
    ~referrerPolicy: string=?,
    ~children: React.element=?,
  ) => React.element = "TileLayer"
}

module Marker = {
  @module("react-leaflet/Marker") @react.component
  external make: (
    ~position: Leaflet.position,
    ~children: React.element=?,
    ~eventHandlers: EventHandlers.t=?,
    ~opacity: float=?,
    ~icon: Leaflet.Icon.t=?,
    ~attribution: string=?,
    ~draggable: bool=?,
    ~pane: string=?,
    ~zIndexOffset: int=?,
  ) => React.element = "Marker"
}

module Popup = {
  @module("react-leaflet/Popup") @react.component
  external make: (
    ~children: React.element,
    ~closeButton: bool=?,
    ~autoClose: bool=?,
    ~closeOnClick: bool=?,
    ~className: string=?,
    ~maxWidth: int=?,
    ~minWidth: int=?,
    ~autoPan: bool=?,
    ~keepInView: bool=?,
    ~closeOnEscapeKey: bool=?,
  ) => React.element = "Popup"
}

module Tooltip = {
  @module("react-leaflet/Tooltip") @react.component
  external make: (
    ~children: React.element,
    ~permanent: bool=?,
    ~direction: [#auto | #top | #bottom | #left | #right | #center]=?,
    ~offset: (int, int)=?,
    ~opacity: float=?,
    ~className: string=?,
    ~pane: string=?,
  ) => React.element = "Tooltip"
}

module Circle = {
  @module("react-leaflet/Circle") @react.component
  external make: (
    ~center: Leaflet.position,
    ~radius: float,
    ~pathOptions: Leaflet.PathOptions.t=?,
    ~children: React.element=?,
    ~eventHandlers: EventHandlers.t=?,
  ) => React.element = "Circle"
}

module CircleMarker = {
  @module("react-leaflet/CircleMarker") @react.component
  external make: (
    ~position: Leaflet.position,
    ~radius: int=?,
    ~pathOptions: Leaflet.PathOptions.t=?,
    ~children: React.element=?,
    ~eventHandlers: EventHandlers.t=?,
  ) => React.element = "CircleMarker"
}

module Rectangle = {
  @module("react-leaflet/Rectangle") @react.component
  external make: (
    ~bounds: Leaflet.bounds,
    ~pathOptions: Leaflet.PathOptions.t=?,
    ~children: React.element=?,
    ~eventHandlers: EventHandlers.t=?,
  ) => React.element = "Rectangle"
}

module Polyline = {
  @module("react-leaflet/Polyline") @react.component
  external make: (
    ~positions: array<Leaflet.position>,
    ~pathOptions: Leaflet.PathOptions.t=?,
    ~children: React.element=?,
    ~eventHandlers: EventHandlers.t=?,
  ) => React.element = "Polyline"
}

module Polygon = {
  @module("react-leaflet/Polygon") @react.component
  external make: (
    ~positions: array<Leaflet.position>,
    ~pathOptions: Leaflet.PathOptions.t=?,
    ~children: React.element=?,
    ~eventHandlers: EventHandlers.t=?,
  ) => React.element = "Polygon"
}

module WMSTileLayer = {
  @module("react-leaflet/WMSTileLayer") @react.component
  external make: (
    ~url: string,
    ~layers: string,
    ~styles: string=?,
    ~format: string=?,
    ~transparent: bool=?,
    ~version: string=?,
    ~attribution: string=?,
    ~maxZoom: int=?,
    ~minZoom: int=?,
    ~opacity: float=?,
  ) => React.element = "WMSTileLayer"
}

module ImageOverlay = {
  @module("react-leaflet/ImageOverlay") @react.component
  external make: (
    ~url: string,
    ~bounds: Leaflet.bounds,
    ~opacity: float=?,
    ~alt: string=?,
    ~eventHandlers: EventHandlers.t=?,
  ) => React.element = "ImageOverlay"
}

module GeoJSON = {
  @module("react-leaflet/GeoJSON") @react.component
  external make: (
    ~data: {..},
    ~style: Leaflet.PathOptions.t=?,
    ~eventHandlers: EventHandlers.t=?,
  ) => React.element = "GeoJSON"
}

module ScaleControl = {
  @module("react-leaflet/ScaleControl") @react.component
  external make: (
    ~position: [#topleft | #topright | #bottomleft | #bottomright]=?,
    ~imperial: bool=?,
    ~metric: bool=?,
    ~maxWidth: int=?,
  ) => React.element = "ScaleControl"
}

module AttributionControl = {
  @module("react-leaflet/AttributionControl") @react.component
  external make: (
    ~position: [#topleft | #topright | #bottomleft | #bottomright]=?,
    ~prefix: string=?,
  ) => React.element = "AttributionControl"
}

module ZoomControl = {
  @module("react-leaflet/ZoomControl") @react.component
  external make: (
    ~position: [#topleft | #topright | #bottomleft | #bottomright]=?,
    ~zoomInText: string=?,
    ~zoomOutText: string=?,
    ~zoomInTitle: string=?,
    ~zoomOutTitle: string=?,
  ) => React.element = "ZoomControl"
}

module MapEvents = {
  type t

  @obj
  external make: (
    ~click: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~dblclick: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~mousedown: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~mouseup: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~mouseover: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~mouseout: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~mousemove: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~contextmenu: Leaflet_EventTypes.leafletMouseEvent => unit=?,
    ~zoomend: Leaflet_EventTypes.leafletEvent => unit=?,
    ~zoomstart: Leaflet_EventTypes.leafletEvent => unit=?,
    ~moveend: Leaflet_EventTypes.leafletEvent => unit=?,
    ~movestart: Leaflet_EventTypes.leafletEvent => unit=?,
    ~resize: Leaflet_EventTypes.leafletEvent => unit=?,
    ~load: Leaflet_EventTypes.leafletEvent => unit=?,
    ~unload: Leaflet_EventTypes.leafletEvent => unit=?,
    unit,
  ) => t = ""
}

module Hooks = {
  type viewport = {
    center: Leaflet.position,
    zoom: int,
  }

  @module("react-leaflet/hooks")
  external useMap: unit => Leaflet.map = "useMap"

  @module("react-leaflet/hooks")
  external useMapEvents: MapEvents.t => Leaflet.map = "useMapEvents"

  @module("react-leaflet/hooks")
  external useMapEvent: (string, Leaflet_EventTypes.mouseEvent => unit) => Leaflet.map = "useMapEvent"

  @module("react-leaflet/hooks")
  external useMapLayers: unit => array<Leaflet.map> = "useMapLayers"

  @module("react-leaflet/hooks")
  external useMapViewport: unit => viewport = "useMapViewport"
}