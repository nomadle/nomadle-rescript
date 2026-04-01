open Vitest

describe("I18nextHttpBackend", () => {
  test("backend options can be created", ctx => {
    let options = I18nextHttpBackend.makeBackendOptions(
      ~loadPath="/locales/{{lng}}/{{ns}}.json",
      ()
    )
    ctx->expect(options.loadPath)->Expect.toBe("/locales/{{lng}}/{{ns}}.json")
    ctx->expect(options.crossDomain)->Expect.toBe(false)
    ctx->expect(options.withCredentials)->Expect.toBe(false)
  })

  test("backend options with custom values", ctx => {
    let options = I18nextHttpBackend.makeBackendOptions(
      ~loadPath="/api/translations/{{lng}}/{{ns}}",
      ~crossDomain=true,
      ~withCredentials=true,
      ()
    )
    ctx->expect(options.loadPath)->Expect.toBe("/api/translations/{{lng}}/{{ns}}")
    ctx->expect(options.crossDomain)->Expect.toBe(true)
    ctx->expect(options.withCredentials)->Expect.toBe(true)
  })

  test("make constructor should be defined", ctx => {
    ctx->expect(I18nextHttpBackend.make)->Expect.toBeTruthy
  })

  test("create alias should be defined", ctx => {
    ctx->expect(I18nextHttpBackend.create)->Expect.toBeTruthy
  })

  test("apiLoadPath constant should be defined", ctx => {
    ctx->expect(I18nextHttpBackend.apiLoadPath)->Expect.toBe("/api/locales/{{lng}}/{{ns}}.json")
  })
})
