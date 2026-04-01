open Vitest

// Test that Pixi types are correctly defined
// Note: @pixi/react cannot be loaded in jsdom environment due to React internals
describe("Pixi Types", () => {
  test("application options type should work", ctx => {
    let options: Pixi.applicationOptions = {
      "width": Some(800),
      "height": Some(600),
      "backgroundColor": Some(0x000000),
      "antialias": Some(true),
      "resolution": Some(1.0),
    }
    
    ctx->expect(options["width"])->Expect.toBe(Some(800))
    ctx->expect(options["height"])->Expect.toBe(Some(600))
  })

  test("application canvas options type should work", ctx => {
    // Create a mock canvas element
    let mockCanvas = %raw(`document.createElement("canvas")`)
    let options: Pixi.applicationCanvasOptions = {
      "width": Some(800),
      "height": Some(600),
      "backgroundColor": Some(0xffffff),
      "antialias": Some(true),
      "resolution": Some(2.0),
      "canvas": mockCanvas,
    }
    
    ctx->expect(options["width"])->Expect.toBe(Some(800))
    ctx->expect(options["canvas"])->Expect.toBe(mockCanvas)
  })

  test("texture options type should work", ctx => {
    let options: Pixi.textureOptions = {
      "scaleMode": Some(#NEAREST),
      "format": Some(#RGBA),
      "mipmap": Some(#ON),
      "anisotropicLevel": Some(16),
      "wrapMode": Some(#CLAMP),
    }
    
    ctx->expect(options["scaleMode"])->Expect.toBe(Some(#NEAREST))
    ctx->expect(options["format"])->Expect.toBe(Some(#RGBA))
  })

  test("text style type should work", ctx => {
    let style: Pixi.textStyle = {
      "fontSize": Some(24),
      "fill": Some(0xff0000),
      "fontFamily": Some("Arial"),
      "align": Some("center"),
    }
    
    ctx->expect(style["fontSize"])->Expect.toBe(Some(24))
    ctx->expect(style["fill"])->Expect.toBe(Some(0xff0000))
  })
})
