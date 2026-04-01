open Vitest

describe("ReactHelmet", () => {
  test("Helmet component should be defined", ctx => {
    ctx->expect(ReactHelmet.Helmet.make)->Expect.toBeTruthy
  })
})
