// Bindings for @pixi/react

// Stage component props type
type stageOptions<'a> = {
  "width": int,
  "height": int,
  "options": option<'a>,
}

@module("@pixi/react")
external stage: React.component<{
  "width": int,
  "height": int,
  "options": option<{..}>,
  "children": React.element,
}> = "Stage"

@module("@pixi/react")
external container: React.component<{
  "x": option<float>,
  "y": option<float>,
  "rotation": option<float>,
  "scaleX": option<float>,
  "scaleY": option<float>,
  "alpha": option<float>,
  "children": option<React.element>,
}> = "Container"

@module("@pixi/react")
external graphics: React.component<{
  "draw": option<'a => unit>,
  "x": option<float>,
  "y": option<float>,
  "rotation": option<float>,
  "scale": option<float>,
  "alpha": option<float>,
}> = "Graphics"

@module("@pixi/react")
external sprite: React.component<{
  "image": string,
  "x": option<float>,
  "y": option<float>,
  "width": option<float>,
  "height": option<float>,
  "anchor": option<float>,
  "rotation": option<float>,
  "scale": option<float>,
  "alpha": option<float>,
}> = "Sprite"

@module("@pixi/react")
external text: React.component<{
  "text": string,
  "x": option<float>,
  "y": option<float>,
  "style": option<{..}>,
  "anchor": option<float>,
  "rotation": option<float>,
  "scale": option<float>,
  "alpha": option<float>,
}> = "Text"

// Hook for animation frame
@module("@pixi/react")
external useTick: (float => unit) => unit = "useTick"

// Graphics drawing functions for Pixi.js v8
type graphics

// New v8 API methods
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

// Deprecated methods (for backward compatibility)
@send external beginFill: (graphics, int) => graphics = "beginFill"
@send external drawCircle: (graphics, float, float, float) => graphics = "drawCircle"
@send external drawRect: (graphics, float, float, float, float) => graphics = "drawRect"
@send external endFill: graphics => graphics = "endFill"
@send external lineStyle: (graphics, float, int) => graphics = "lineStyle"
