type map

type position = (float, float)

type bounds = array<position>

type mapOptions = {
  center: position,
  zoom: int,
  scrollWheelZoom?: bool,
  zoomControl?: bool,
  attributionControl?: bool,
}

module LatLng = {
  type t

  @module("leaflet") @new
  external make: (float, float) => t = "LatLng"

  @get external lat: t => float = "lat"
  @get external lng: t => float = "lng"
  @get external alt: t => float = "alt"
}

module LatLngBounds = {
  type t

  @module("leaflet") @new
  external make: (position, position) => t = "LatLngBounds"

  @module("leaflet") @new
  external fromBounds: (position, position) => t = "latLngBounds"

  @send external getNorth: t => float = "getNorth"
  @send external getSouth: t => float = "getSouth"
  @send external getEast: t => float = "getEast"
  @send external getWest: t => float = "getWest"
  @send external getCenter: t => LatLng.t = "getCenter"
}

module Point = {
  type t

  @module("leaflet") @new
  external make: (float, float) => t = "Point"

  @get external x: t => float = "x"
  @get external y: t => float = "y"
}

module Icon = {
  type t
  type options = {}
  type defaultOptions = {
    iconUrl: string,
    iconRetinaUrl?: string,
    iconSize?: (float, float),
    iconAnchor?: (float, float),
    popupAnchor?: (float, float),
    tooltipAnchor?: (float, float),
    shadowUrl?: string,
    shadowRetinaUrl?: string,
    shadowSize?: (float, float),
    shadowAnchor?: (float, float),
    className?: string,
  }

  @module("leaflet") @new
  external create: defaultOptions => t = "Icon"

  @module("leaflet") @new
  external divIcon: {..} => t = "DivIcon"

  let createDefault = (~iconUrl, ~iconSize=?, ~iconAnchor=?, ~popupAnchor=?, ()) => {
    let options = (%raw("{}"): dict<string>)
    Dict.set(options, "iconUrl", iconUrl->Obj.magic)

    switch iconSize {
    | Some((w, h)) => Dict.set(options, "iconSize", [w, h]->Obj.magic)
    | None => ()
    }

    switch iconAnchor {
    | Some((x, y)) => Dict.set(options, "iconAnchor", [x, y]->Obj.magic)
    | None => ()
    }

    switch popupAnchor {
    | Some((x, y)) => Dict.set(options, "popupAnchor", [x, y]->Obj.magic)
    | None => ()
    }

    create(options->Obj.magic)
  }

  let createDivIcon = (~html=?, ~className=?, ~iconSize=?, ~iconAnchor=?, ~popupAnchor=?, ()) => {
    let options = (%raw("{}"): dict<string>)

    switch html {
    | Some(h) => Dict.set(options, "html", h->Obj.magic)
    | None => ()
    }

    switch className {
    | Some(c) => Dict.set(options, "className", c->Obj.magic)
    | None => ()
    }

    switch iconSize {
    | Some((w, h)) => Dict.set(options, "iconSize", [w, h]->Obj.magic)
    | None => ()
    }

    switch iconAnchor {
    | Some((x, y)) => Dict.set(options, "iconAnchor", [x, y]->Obj.magic)
    | None => ()
    }

    switch popupAnchor {
    | Some((x, y)) => Dict.set(options, "popupAnchor", [x, y]->Obj.magic)
    | None => ()
    }

    divIcon(options->Obj.magic)
  }
}

module PathOptions = {
  type t

  @obj
  external make: (
    ~color: string=?,
    ~weight: int=?,
    ~opacity: float=?,
    ~fillColor: string=?,
    ~fillOpacity: float=?,
    ~lineCap: string=?,
    ~lineJoin: string=?,
    ~dashArray: string=?,
    ~dashOffset: string=?,
    ~fillRule: string=?,
    ~className: string=?,
    unit,
  ) => t = ""
}

module EventTypes = {
  type mouseEvent
  type leafletEvent
  type leafletMouseEvent

  @get external latlng: mouseEvent => position = "latlng"
  @get external type_: mouseEvent => string = "type"
  @get external target: mouseEvent => map = "target"
  @get external sourceTarget: mouseEvent => map = "sourceTarget"
  @get external containerPoint: mouseEvent => (float, float) = "containerPoint"
  @get external layerPoint: mouseEvent => (float, float) = "layerPoint"
  @get external originalEvent: mouseEvent => Dom.mouseEvent = "originalEvent"
}

module EventHandlers = {
  type t

  @obj
  external make: (
    ~click: EventTypes.leafletMouseEvent => unit=?,
    ~dblclick: EventTypes.leafletMouseEvent => unit=?,
    ~mousedown: EventTypes.leafletMouseEvent => unit=?,
    ~mouseup: EventTypes.leafletMouseEvent => unit=?,
    ~mouseover: EventTypes.leafletMouseEvent => unit=?,
    ~mouseout: EventTypes.leafletMouseEvent => unit=?,
    ~mousemove: EventTypes.leafletMouseEvent => unit=?,
    ~contextmenu: EventTypes.leafletMouseEvent => unit=?,
    ~keypress: EventTypes.leafletEvent => unit=?,
    ~preclick: EventTypes.leafletMouseEvent => unit=?,
    unit,
  ) => t = ""
}

module TileLayer = {
  type t
  type options

  @obj
  external options: (
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
    unit,
  ) => options = ""

  @module("leaflet") @new
  external create: options => t = "TileLayer"

  @send external addTo: (t, map) => t = "addTo"
  @send external remove: t => unit = "remove"
  @send external setUrl: (t, string) => unit = "setUrl"
  @send external setOpacity: (t, float) => unit = "setOpacity"
}

module Marker = {
  type t

  @module("leaflet") @new
  external create: position => t = "Marker"

  @send external addTo: (t, map) => t = "addTo"
  @send external remove: t => unit = "remove"
  @send external setLatLng: (t, position) => unit = "setLatLng"
  @send external setIcon: (t, Icon.t) => unit = "setIcon"
  @send external setOpacity: (t, float) => unit = "setOpacity"
  @send external setZIndexOffset: (t, int) => unit = "setZIndexOffset"
  @send external setDraggable: (t, bool) => unit = "setDraggable"
  @send external getLatLng: t => position = "getLatLng"
  @send external getPopup: t => Nullable.t<{..}> = "getPopup"
  @send external getTooltip: t => Nullable.t<{..}> = "getTooltip"
  @send external isPopupOpen: t => bool = "isPopupOpen"
  @send external isTooltipOpen: t => bool = "isTooltipOpen"
}

module Circle = {
  type t

  @module("leaflet") @new
  external create: (~center: position, ~radius: float, ~pathOptions: PathOptions.t=?, unit) => t = "Circle"

  @send external addTo: (t, map) => t = "addTo"
  @send external remove: t => unit = "remove"
  @send external setLatLng: (t, position) => unit = "setLatLng"
  @send external setRadius: (t, float) => unit = "setRadius"
  @send external setStyle: (t, PathOptions.t) => unit = "setStyle"
  @send external getLatLng: t => position = "getLatLng"
  @send external getRadius: t => float = "getRadius"
}

module CircleMarker = {
  type t

  @module("leaflet") @new
  external create: (position, ~radius: int=?, ~pathOptions: PathOptions.t=?, unit) => t = "CircleMarker"

  @send external addTo: (t, map) => t = "addTo"
  @send external remove: t => unit = "remove"
  @send external setLatLng: (t, position) => unit = "setLatLng"
  @send external setRadius: (t, int) => unit = "setRadius"
  @send external setStyle: (t, PathOptions.t) => unit = "setStyle"
}

module Polyline = {
  type t

  @module("leaflet") @new
  external create: (array<position>, ~pathOptions: PathOptions.t=?, unit) => t = "Polyline"

  @send external addTo: (t, map) => t = "addTo"
  @send external remove: t => unit = "remove"
  @send external setLatLngs: (t, array<position>) => unit = "setLatLngs"
  @send external setStyle: (t, PathOptions.t) => unit = "setStyle"
  @send external getLatLngs: t => array<position> = "getLatLngs"
}

module Polygon = {
  type t

  @module("leaflet") @new
  external create: (array<position>, ~pathOptions: PathOptions.t=?, unit) => t = "Polygon"

  @send external addTo: (t, map) => t = "addTo"
  @send external remove: t => unit = "remove"
  @send external setLatLngs: (t, array<position>) => unit = "setLatLngs"
  @send external setStyle: (t, PathOptions.t) => unit = "setStyle"
}

module Rectangle = {
  type t

  @module("leaflet") @new
  external create: (LatLngBounds.t, ~pathOptions: PathOptions.t=?, unit) => t = "Rectangle"

  @send external addTo: (t, map) => t = "addTo"
  @send external remove: t => unit = "remove"
  @send external setBounds: (t, LatLngBounds.t) => unit = "setBounds"
  @send external setStyle: (t, PathOptions.t) => unit = "setStyle"
}

module ImageOverlay = {
  type t

  @module("leaflet") @new
  external create: (~url: string, ~bounds: LatLngBounds.t, ~options: {..}=?, unit) => t = "ImageOverlay"

  @send external addTo: (t, map) => t = "addTo"
  @send external remove: t => unit = "remove"
  @send external setUrl: (t, string) => unit = "setUrl"
  @send external setOpacity: (t, float) => unit = "setOpacity"
}

module GeoJSON = {
  type t

  @module("leaflet") @new
  external create: (~data: {..}, ~options: {..}=?, unit) => t = "GeoJSON"

  @send external addTo: (t, map) => t = "addTo"
  @send external remove: t => unit = "remove"
  @send external clearLayers: t => unit = "clearLayers"
  @send external addData: (t, {..}) => unit = "addData"
}

module LayerGroup = {
  type t

  @module("leaflet") @new
  external create: unit => t = "LayerGroup"

  @send external addTo: (t, map) => t = "addTo"
  @send external remove: t => unit = "remove"
  @send external clearLayers: t => unit = "clearLayers"
  @send external addLayer: (t, map) => t = "addLayer"
  @send external removeLayer: (t, map) => unit = "removeLayer"
}

module FeatureGroup = {
  type t

  @module("leaflet") @new
  external create: unit => t = "FeatureGroup"

  @send external addTo: (t, map) => t = "addTo"
  @send external remove: t => unit = "remove"
  @send external clearLayers: t => unit = "clearLayers"
  @send external addLayer: (t, map) => t = "addLayer"
  @send external setStyle: (t, PathOptions.t) => unit = "setStyle"
  @send external bringToFront: t => unit = "bringToFront"
  @send external bringToBack: t => unit = "bringToBack"
}

module Control = {
  type t

  module Options = {
    type position = [#topleft | #topright | #bottomleft | #bottomright]

    type t

    @obj
    external make: (~position: position=?, unit) => t = ""
  }

  @module("leaflet") @new
  external create: Options.t => t = "Control"

  @send external addTo: (t, map) => t = "addTo"
  @send external remove: t => unit = "remove"
  @send external getContainer: t => Dom.element = "getContainer"
  @send external setPosition: (t, Options.position) => unit = "setPosition"
  @send external getPosition: t => Options.position = "getPosition"
}

module ScaleControl = {
  type t

  @module("leaflet") @new
  external create: (~options: {..}=?, unit) => t = "ScaleControl"

  @send external addTo: (t, map) => t = "addTo"
  @send external remove: t => unit = "remove"
  @send external setMetric: (t, bool) => unit = "setMetric"
  @send external setImperial: (t, bool) => unit = "setImperial"
  @send external setMaxWidth: (t, int) => unit = "setMaxWidth"
}

module Map = {
  type t = map

  @module("leaflet") @new
  external create: (Dom.element, ~options: {..}=?, unit) => t = "Map"

  @send external addLayer: (t, map) => t = "addLayer"
  @send external removeLayer: (t, map) => t = "removeLayer"
  @send external hasLayer: (t, map) => bool = "hasLayer"

  @send external setView: (t, position, ~zoom: int=?, ~options: {..}=?, unit) => t = "setView"
  @send external setZoom: (t, int, ~options: {..}=?, unit) => t = "setZoom"
  @send external zoomIn: (t, ~delta: float=?, ~options: {..}=?, unit) => t = "zoomIn"
  @send external zoomOut: (t, ~delta: float=?, ~options: {..}=?, unit) => t = "zoomOut"
  @send external setZoomAround: (t, position, int, ~options: {..}=?, unit) => t = "setZoomAround"
  @send external fitBounds: (t, LatLngBounds.t, ~options: {..}=?, unit) => t = "fitBounds"

  @send external panTo: (t, position, ~options: {..}=?, unit) => t = "panTo"
  @send external panBy: (t, (float, float), ~options: {..}=?, unit) => t = "panBy"
  @send external flyTo: (t, position, ~zoom: int=?, ~options: {..}=?, unit) => t = "flyTo"
  @send external flyToBounds: (t, LatLngBounds.t, ~options: {..}=?, unit) => t = "flyToBounds"

  @send external getCenter: t => LatLng.t = "getCenter"
  @send external getZoom: t => int = "getZoom"
  @send external getBounds: t => LatLngBounds.t = "getBounds"
  @send external getMinZoom: t => int = "getMinZoom"
  @send external getMaxZoom: t => int = "getMaxZoom"

  @send external invalidateSize: (t, ~options: {..}=?, unit) => t = "invalidateSize"

  @send external addControl: (t, Control.t) => t = "addControl"
  @send external removeControl: (t, Control.t) => t = "removeControl"

  @send external on: (t, string, 'event => unit) => t = "on"
  @send external off: (t, string, 'event => unit) => t = "off"
  @send external once: (t, string, 'event => unit) => t = "once"

  @send external getContainer: t => Dom.element = "getContainer"
  @send external getPanes: t => {..} = "getPanes"

  @send external closePopup: t => unit = "closePopup"
  @send external closeTooltip: t => unit = "closeTooltip"
}