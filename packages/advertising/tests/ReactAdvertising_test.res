open Vitest

describe("ReactAdvertising", () => {
  test("Provider should be defined", ctx => {
    ctx->expect(ReactAdvertising.Provider.make)->Expect.toBeTruthy
  })

  test("Slot should be defined", ctx => {
    ctx->expect(ReactAdvertising.Slot.make)->Expect.toBeTruthy
  })

  test("Config.make creates config", ctx => {
    let config = ReactAdvertising.Config.make(~slots=[])
    ctx->expect(config)->Expect.toBeTruthy
  })

  test("Config.makeSlot creates slot config", ctx => {
    let slot = ReactAdvertising.Config.makeSlot(
      ~id="test-ad",
      ~path="/123/test",
      ~sizes=[(300, 250)],
    )
    ctx->expect(slot)->Expect.toBeTruthy
    ctx->expect(slot.id)->Expect.toBe("test-ad")
  })

  test("Config.Sizes constants are defined", ctx => {
    ctx->expect(ReactAdvertising.Config.Sizes.leaderboard)->Expect.toEqual((728, 90))
    ctx->expect(ReactAdvertising.Config.Sizes.mediumRectangle)->Expect.toEqual((300, 250))
  })
})
