// Bindings for @fastify/cors

// Abstract types for Fastify (defined locally to avoid dependency)
type fastifyInstance

type corsOptions = {
  origin?: array<string>,
  methods?: array<string>,
  allowedHeaders?: array<string>,
  exposedHeaders?: array<string>,
  credentials?: bool,
  maxAge?: int,
}

type t = (fastifyInstance, corsOptions, unit) => promise<unit>

@module("@fastify/cors")
external default: t = "default"
