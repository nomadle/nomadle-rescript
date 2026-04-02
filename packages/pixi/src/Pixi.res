// Bindings for pixi.js core

// Application types and bindings
type application
type applicationOptions = {
  "width": option<int>,
  "height": option<int>,
  "backgroundColor": option<int>,
  "antialias": option<bool>,
  "resolution": option<float>,
}

type applicationCanvasOptions = {
  "width": option<int>,
  "height": option<int>,
  "backgroundColor": option<int>,
  "antialias": option<bool>,
  "resolution": option<float>,
  "canvas": Dom.element,
}

// Application creation (v8 API)
@module("pixi.js") @new external createApplication: unit => application = "Application"
@send external init: (application, applicationOptions) => promise<unit> = "init"
@send external initWithCanvas: (application, applicationCanvasOptions) => promise<unit> = "init"

// Application methods
@get external canvas: application => Dom.element = "canvas"
@get external stage: application => 'a = "stage"
@get external ticker: application => 'a = "ticker"
@send external destroy: application => unit = "destroy"
@send external resize: (application, int, int) => unit = "resize"

// Base display object type
type displayObject

// Container type and methods
type container = displayObject
@module("pixi.js") @new external createContainer: unit => container = "Container"
@send external addChild: (container, displayObject) => displayObject = "addChild"
@send external removeChild: (container, displayObject) => displayObject = "removeChild"
@set external setX: (displayObject, float) => unit = "x"
@set external setY: (displayObject, float) => unit = "y"
@set external setRotation: (displayObject, float) => unit = "rotation"
@set external setScale: (displayObject, float) => unit = "scale"
@set external setAlpha: (displayObject, float) => unit = "alpha"
@get external getX: displayObject => float = "x"
@get external getY: displayObject => float = "y"

// Graphics type and methods (v8 API)
type graphics = displayObject
@module("pixi.js") @new external createGraphics: unit => graphics = "Graphics"

// New v8 drawing methods
@send external fill: (graphics, int) => graphics = "fill"
@send external fillWithOptions: (graphics, {"color": int, "alpha": float}) => graphics = "fill"
@send external circle: (graphics, float, float, float) => graphics = "circle"
@send external rect: (graphics, float, float, float, float) => graphics = "rect"
@send external poly: (graphics, array<float>) => graphics = "poly"
@send external setStrokeStyle: (graphics, {"width": float, "color": int}) => graphics = "setStrokeStyle"
@send external stroke: graphics => graphics = "stroke"
@send external moveTo: (graphics, float, float) => graphics = "moveTo"
@send external lineTo: (graphics, float, float) => graphics = "lineTo"
@send external clear: graphics => graphics = "clear"
@send external closePath: graphics => graphics = "closePath"

// Texture options
// https://pixijs.download/dev/docs/index.html#type-TextureOptions
type textureOptions = {
  "scaleMode": option<[#NEAREST | #LINEAR | #NEAREST_MIPMAP_LINEAR | #LINEAR_MIPMAP_NEAREST | #NEAREST_MIPMAP_NEAREST | #LINEAR_MIPMAP_LINEAR]>,
  "format": option<[#RGBA | #RGB | #ALPHA]>,
  "mipmap": option<[#OFF | #POW2 | #ON]>,
  "anisotropicLevel": option<int>,
  "wrapMode": option<[#CLAMP | #REPEAT | #MIRRORED_REPEAT]>,
}

// Sprite type and methods
type sprite = displayObject
type texture
@module("pixi.js") @scope("Texture")
external fromURL: string => promise<texture> = "from"
@module("pixi.js") @new external createSprite: texture => sprite = "Sprite"
@set external setSpriteAnchor: (sprite, float) => unit = "anchor"

// Text type and methods
type text = displayObject
type textStyle = {
  "fontSize": option<int>,
  "fill": option<int>,
  "fontFamily": option<string>,
  "align": option<string>,
}
@module("pixi.js") @new external createText: (string, textStyle) => text = "Text"
@set external setTextAnchor: (text, float) => unit = "anchor"

// Ticker for animations
type ticker
@send external add: (ticker, float => unit) => unit = "add"
@send external remove: (ticker, float => unit) => unit = "remove"
@send external start: ticker => unit = "start"
@send external stop: ticker => unit = "stop"

// Color utilities
@module("pixi.js") @scope("Color")
external fromHex: string => int = "from"

@module("pixi.js") @scope("Color")
external fromRGB: (int, int, int) => int = "from"
