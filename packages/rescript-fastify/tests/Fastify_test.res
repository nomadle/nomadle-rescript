open Vitest

describe("Fastify", () => {
  test("make should create fastify instance", ctx => {
    ctx->expect(Fastify.make)->Expect.toBeTruthy
  })

  test("get route method should be defined", ctx => {
    ctx->expect(Fastify.get)->Expect.toBeTruthy
  })

  test("post route method should be defined", ctx => {
    ctx->expect(Fastify.post)->Expect.toBeTruthy
  })

  test("serverOptions type should work", ctx => {
    let opts: Fastify.serverOptions = {
      logger: true,
    }
    // Accessing optional field returns option<'a>
    switch opts.logger {
    | Some(logger) => ctx->expect(logger)->Expect.toBe(true)
    | None => ctx->expect(false)->Expect.toBe(true)
    }
  })

  test("listenOptions type should work", ctx => {
    let opts: Fastify.listenOptions = {
      port: 3000,
    }
    switch opts.port {
    | Some(port) => ctx->expect(port)->Expect.toBe(3000)
    | None => ctx->expect(false)->Expect.toBe(true)
    }
  })
})
