open Vitest

describe("ReactI18next", () => {
  test("useTranslation hook should be defined", ctx => {
    ctx->expect(ReactI18next.useTranslation)->Expect.toBeTruthy
  })

  test("Trans component should be defined", ctx => {
    ctx->expect(ReactI18next.Trans.make)->Expect.toBeTruthy
  })
})
