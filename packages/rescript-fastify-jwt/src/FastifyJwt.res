// Bindings for @fastify/jwt

type jwtOptions = {
  secret: string,
}

type t = (Fastify.t, jwtOptions, unit) => Js.Promise.t<unit>

@module("@fastify/jwt")
external default: t = "default"

// JWT verification - attached to request
@send
external jwtVerify: (Fastify.request, string) => Js.Promise.t<Js.Dict.t<Js.Json.t>> = "jwtVerify"

// JWT verify without options
@send
external jwtVerifyDefault: Fastify.request => Js.Promise.t<Js.Dict.t<Js.Json.t>> = "jwtVerify"
