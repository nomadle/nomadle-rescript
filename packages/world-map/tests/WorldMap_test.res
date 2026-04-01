open Vitest

describe("ReactWorldMap", () => {
  test("WorldMap component should be defined", ctx => {
    ctx->expect(ReactWorldMap.make)->Expect.toBeTruthy
  })

  test("default export should be defined", ctx => {
    ctx->expect(ReactWorldMap.default)->Expect.toBeTruthy
  })
})

describe("ReactWordMapTypes", () => {
  test("continentFromString should parse na to NorthAmerica", ctx => {
    ctx
    ->expect(ReactWordMapTypes.continentFromString("na"))
    ->Expect.toEqual(Some(#NorthAmerica))
  })

  test("continentFromString should parse eu to Europe", ctx => {
    ctx
    ->expect(ReactWordMapTypes.continentFromString("eu"))
    ->Expect.toEqual(Some(#Europe))
  })

  test("continentFromString should return None for invalid string", ctx => {
    ctx
    ->expect(ReactWordMapTypes.continentFromString("xx"))
    ->Expect.toEqual(None)
  })

  test("continentToString should convert NorthAmerica to na", ctx => {
    ctx
    ->expect(ReactWordMapTypes.continentToString(#NorthAmerica))
    ->Expect.toEqual("na")
  })

  test("continentToString should convert Europe to eu", ctx => {
    ctx
    ->expect(ReactWordMapTypes.continentToString(#Europe))
    ->Expect.toEqual("eu")
  })

  test("continentToFullName should return full names", ctx => {
    ctx->expect(ReactWordMapTypes.continentToFullName(#NorthAmerica))->Expect.toEqual("North America")
    ctx->expect(ReactWordMapTypes.continentToFullName(#SouthAmerica))->Expect.toEqual("South America")
    ctx->expect(ReactWordMapTypes.continentToFullName(#Africa))->Expect.toEqual("Africa")
    ctx->expect(ReactWordMapTypes.continentToFullName(#Europe))->Expect.toEqual("Europe")
    ctx->expect(ReactWordMapTypes.continentToFullName(#Asia))->Expect.toEqual("Asia")
    ctx->expect(ReactWordMapTypes.continentToFullName(#Oceania))->Expect.toEqual("Oceania")
  })

  test("round-trip conversion should work", ctx => {
    let continents = [#NorthAmerica, #SouthAmerica, #Africa, #Europe, #Asia, #Oceania]
    
    Belt.Array.forEach(continents, continent => {
      let str = ReactWordMapTypes.continentToString(continent)
      let parsed = ReactWordMapTypes.continentFromString(str)
      ctx->expect(parsed)->Expect.toEqual(Some(continent))
    })
  })
})
