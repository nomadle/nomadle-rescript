open Vitest

describe("ReactAvatarEditor", () => {
  test("make component should be defined", ctx => {
    ctx->expect(ReactAvatarEditor.make)->Expect.toBeTruthy
  })

  test("getEditorInstance should be defined", ctx => {
    ctx->expect(ReactAvatarEditor.getEditorInstance)->Expect.toBeTruthy
  })

  test("position type should work", ctx => {
    let pos: ReactAvatarEditor.position = {x: 0.5, y: 0.5}
    ctx->expect(pos.x)->Expect.toBe(0.5)
    ctx->expect(pos.y)->Expect.toBe(0.5)
  })

  test("imgInfo type should work", ctx => {
    let info: ReactAvatarEditor.imgInfo = {
      x: 10.0,
      y: 20.0,
      width: 100.0,
      height: 100.0,
      resource: "https://example.com/image.jpg",
    }
    
    ctx->expect(info.x)->Expect.toBe(10.0)
    ctx->expect(info.width)->Expect.toBe(100.0)
    ctx->expect(info.resource)->Expect.toBe("https://example.com/image.jpg")
  })

  test("color type should work", ctx => {
    let color: ReactAvatarEditor.color = (255, 0, 0, 0.5)
    ctx->expect(color)->Expect.toEqual((255, 0, 0, 0.5))
  })

  test("imageProp variant should work", ctx => {
    let urlImage = ReactAvatarEditor.Url("https://example.com/image.jpg")
    ctx->expect(urlImage)->Expect.toBeTruthy
    
    // Verify we can match on the variant
    switch urlImage {
    | Url(url) => ctx->expect(url)->Expect.toBe("https://example.com/image.jpg")
    | Blob(_) => ctx->expect(false)->Expect.toBe(true)
    }
  })
})
