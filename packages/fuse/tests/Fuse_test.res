open Vitest

type namedItem = {name: string}

describe("Fuse", () => {
  test("make should create a fuse instance", ctx => {
    let data: array<namedItem> = [{name: "apple"}, {name: "banana"}]
    let fuse = Fuse.make(data, {
      keys: ["name"],
      threshold: 0.4,
    })
    ctx->expect(fuse)->Expect.toBeTruthy
  })

  test("search should return matching results", ctx => {
    let data: array<namedItem> = [{name: "apple"}, {name: "banana"}, {name: "grape"}]
    let fuse = Fuse.make(data, {
      keys: ["name"],
      threshold: 0.4,
    })
    let results = fuse->Fuse.search("apple")
    ctx->expect(Js.Array2.length(results))->Expect.toBe(1)
    ctx->expect(results[0].item.name)->Expect.toBe("apple")
  })

  test("search should return multiple matches", ctx => {
    let data: array<namedItem> = [{name: "apple"}, {name: "application"}, {name: "banana"}]
    let fuse = Fuse.make(data, {
      keys: ["name"],
      threshold: 0.4,
    })
    let results = fuse->Fuse.search("app")
    ctx->expect(Js.Array2.length(results) >= 1)->Expect.toBe(true)
  })

  test("search should return empty array for no matches", ctx => {
    let data: array<namedItem> = [{name: "apple"}, {name: "banana"}]
    let fuse = Fuse.make(data, {
      keys: ["name"],
      threshold: 0.4,
    })
    let results = fuse->Fuse.search("xyz")
    ctx->expect(Js.Array2.length(results))->Expect.toBe(0)
  })

  test("search results should have item and refIndex", ctx => {
    let data: array<namedItem> = [{name: "apple"}]
    let fuse = Fuse.make(data, {
      keys: ["name"],
      threshold: 0.4,
    })
    let results = fuse->Fuse.search("apple")
    ctx->expect(results[0].item)->Expect.toBeTruthy
    ctx->expect(results[0].refIndex)->Expect.toBe(0)
  })
})
