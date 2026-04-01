// Bindings for @fastify/static

// Abstract types for Fastify (defined locally to avoid dependency)
type fastifyInstance

type staticOptions = {
  root: string,
  prefix?: string,
  decorateReply?: bool,
  serve?: bool,
  wildcard?: bool,
}

type t = (fastifyInstance, staticOptions, unit) => Js.Promise.t<unit>

@module("@fastify/static")
external default: t = "default"
