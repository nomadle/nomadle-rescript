open Vitest

describe("ReactHelmetAsync", () => {
  test("HelmetProvider should be defined", ctx => {
    ctx->expect(ReactHelmetAsync.HelmetProvider.make)->Expect.toBeTruthy
  })

  test("Helmet should be defined", ctx => {
    ctx->expect(ReactHelmetAsync.Helmet.make)->Expect.toBeTruthy
  })
})
