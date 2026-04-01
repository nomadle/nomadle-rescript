open Vitest

describe("Mongoose", () => {
  test("connection constants should be defined", ctx => {
    ctx->expect(Mongoose.connected)->Expect.toBe(1)
    ctx->expect(Mongoose.disconnected)->Expect.toBe(0)
    ctx->expect(Mongoose.connecting)->Expect.toBe(2)
    ctx->expect(Mongoose.disconnecting)->Expect.toBe(3)
  })

  test("isConnected should work with readyState", ctx => {
    // Test the helper function logic
    let mockConn = %raw(`{ readyState: 1 }`)
    ctx->expect(Mongoose.isConnected(mockConn))->Expect.toBe(true)
    
    let mockConn2 = %raw(`{ readyState: 0 }`)
    ctx->expect(Mongoose.isConnected(mockConn2))->Expect.toBe(false)
  })

  test("isDisconnected should work with readyState", ctx => {
    let mockConn = %raw(`{ readyState: 0 }`)
    ctx->expect(Mongoose.isDisconnected(mockConn))->Expect.toBe(true)
    
    let mockConn2 = %raw(`{ readyState: 1 }`)
    ctx->expect(Mongoose.isDisconnected(mockConn2))->Expect.toBe(false)
  })

  test("schema types should be defined", ctx => {
    ctx->expect(Mongoose.SchemaTypes.objectId)->Expect.toBeTruthy
    ctx->expect(Mongoose.SchemaTypes.string)->Expect.toBeTruthy
    ctx->expect(Mongoose.SchemaTypes.number)->Expect.toBeTruthy
    ctx->expect(Mongoose.SchemaTypes.boolean)->Expect.toBeTruthy
    ctx->expect(Mongoose.SchemaTypes.date)->Expect.toBeTruthy
    ctx->expect(Mongoose.SchemaTypes.mixed)->Expect.toBeTruthy
  })

  test("array type helpers should be defined", ctx => {
    ctx->expect(Mongoose.SchemaTypes.stringArray)->Expect.toBeTruthy
    ctx->expect(Mongoose.SchemaTypes.numberArray)->Expect.toBeTruthy
    ctx->expect(Mongoose.SchemaTypes.mixedArray)->Expect.toBeTruthy
  })

  test("isValidObjectId should be a function", ctx => {
    ctx->expect(Mongoose.isValidObjectId)->Expect.toBeTruthy
  })

  test("isObjectIdOrHexString should be a function", ctx => {
    ctx->expect(Mongoose.isObjectIdOrHexString)->Expect.toBeTruthy
  })
})

describe("Schema", () => {
  test("schema function should be defined", ctx => {
    ctx->expect(Mongoose.schema)->Expect.toBeTruthy
  })

  test("schema options type should work", ctx => {
    let options: Mongoose.schemaOptions = {
      timestamps: true,
      collection: "test",
      strict: true,
    }
    ctx->expect(options.timestamps)->Expect.toBe(Some(true))
    ctx->expect(options.collection)->Expect.toBe(Some("test"))
    ctx->expect(options.strict)->Expect.toBe(Some(true))
  })
})

describe("Model", () => {
  test("model function should be defined", ctx => {
    ctx->expect(Mongoose.model)->Expect.toBeTruthy
  })

  test("getOrCreateModel should be a function", ctx => {
    ctx->expect(Mongoose.getOrCreateModel)->Expect.toBeTruthy
  })
})
