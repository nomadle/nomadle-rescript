// Bindings for @fastify/jwt

type jwtOptions = {
  secret: string,
}

type t = (Fastify.t, jwtOptions, unit) => promise<unit>

@module("@fastify/jwt")
external default: t = "default"

// JWT verification - attached to request
@send
external jwtVerify: (Fastify.request, string) => promise<dict<JSON.t>> = "jwtVerify"

// JWT verify without options
@send
external jwtVerifyDefault: Fastify.request => promise<dict<JSON.t>> = "jwtVerify"
