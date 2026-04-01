open Vitest

describe("I18next", () => {
  test("i18n instance should be defined", ctx => {
    ctx->expect(I18next.i18n)->Expect.toBeTruthy
  })

  test("makeInitOptions creates correct options", ctx => {
    let options = I18next.makeInitOptions(
      ~fallbackLng="en",
      ~debug=true,
      ~lng="zh",
      ()
    )
    ctx->expect(options.fallbackLng)->Expect.toBe(Some("en"))
    ctx->expect(options.debug)->Expect.toBe(Some(true))
    ctx->expect(options.lng)->Expect.toBe(Some("zh"))
  })

  test("makeTOptions creates correct options", ctx => {
    let options = I18next.makeTOptions(
      ~count=5,
      ~defaultValue="default",
      ()
    )
    ctx->expect(options.count)->Expect.toBe(Some(5))
    ctx->expect(options.defaultValue)->Expect.toBe(Some("default"))
  })

  test("tFunction type should work", ctx => {
    let t: I18next.tFunction = (key, ~options=?) => {
      ignore(options)
      key
    }
    ctx->expect(t("test.key"))->Expect.toBe("test.key")
  })
})
