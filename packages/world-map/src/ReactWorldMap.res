/**
 * ReactWorldMap.res - ReScript bindings for react-world-map library
 *
 * Provides bindings for the react-world-map npm package that renders
 * a clickable SVG world map with continent selection capabilities.
 * The binding stays faithful to the underlying JS API.
 */
@module("react-world-map")
@react.component
external make: (
  ~selected: string=?,
  ~onSelect: string => unit=?,
  ~multiple: bool=?,
) => React.element = "default"

let default = make
