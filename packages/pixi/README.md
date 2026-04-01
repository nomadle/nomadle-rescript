# @nomadle/rescript-pixi

ReScript bindings for [pixi.js](https://pixijs.com/) (v8) and [@pixi/react](https://github.com/pixijs/pixi-react) - 2D WebGL renderer with React integration.

## Installation

```bash
npm install @nomadle/rescript-pixi pixi.js @pixi/react
# or
pnpm add @nomadle/rescript-pixi pixi.js @pixi/react
```

Add to your `rescript.json`:

```json
{
  "bs-dependencies": ["@nomadle/rescript-pixi"]
}
```

## Usage

### Pixi.js Core

```rescript
open Pixi

// Create an application
let app = createApplication()

// Initialize with options
let init = async () => {
  await app->init({
    "width": Some(800),
    "height": Some(600),
    "backgroundColor": Some(0x1099bb),
    "antialias": Some(true),
    "resolution": Some(1.0),
  })
  
  // Get canvas and append to DOM
  let canvas = app->canvas
  // append canvas to your container...
  
  // Create a graphics object
  let graphics = createGraphics()
  graphics
    ->rect(50.0, 50.0, 100.0, 100.0)
    ->fill(0xff0000)
  
  // Add to stage
  app->stage->addChild(graphics)
}
```

### React Components

```rescript
open PixiReact

@react.component
let make = () => {
  <Stage width=800 height=600 options={Some({"background": 0x1099bb})}>
    <Container x={Some(100.0)} y={Some(100.0)}>
      <Sprite 
        image="/assets/bunny.png" 
        x={Some(0.0)} 
        y={Some(0.0)}
        anchor={Some(0.5)}
      />
      <Text 
        text="Hello Pixi!" 
        x={Some(0.0)} 
        y={Some(50.0)}
        style={Some({"fontSize": 24, "fill": 0xffffff})}
      />
    </Container>
  </Stage>
}
```

### Animation Hook

```rescript
open PixiReact

@react.component
let make = () => {
  let (rotation, setRotation) = React.useState(() => 0.0)
  
  useTick(delta => {
    setRotation(r => r + 0.01 *. delta)
  })
  
  <Sprite 
    image="/assets/sprite.png" 
    rotation={Some(rotation)}
  />
}
```

## License

MIT
