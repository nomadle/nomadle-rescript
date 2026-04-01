// Bindings for @fastify/rate-limit

// Abstract types for Fastify (defined locally to avoid dependency)
type fastifyInstance

type rateLimitOptions = {
  max: int,
  timeWindow: string,
  allowList?: (Js.Dict.t<Js.Json.t>, string) => bool,
}

type t = (fastifyInstance, rateLimitOptions, unit) => Js.Promise.t<unit>

@module("@fastify/rate-limit")
external default: t = "default"
