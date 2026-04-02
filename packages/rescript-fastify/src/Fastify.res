/**
 * Fastify 5.x bindings for ReScript
 * Minimal bindings focused on core functionality
 */

// Core types
type t
type request
type reply

type serverOptions = {
  logger?: bool,
  trustProxy?: bool,
}

type listenOptions = {
  port?: int,
  host?: string,
}

// Route handler types
type handler = (request, reply) => promise<unit>
type syncHandler = (request, reply) => unit

// Request/Reply helpers
@get external getHeaders: request => dict<string> = "headers"
@get external getBody: request => 'a = "body"
@get external getParams: request => dict<string> = "params"
@get external getQuery: request => dict<string> = "query"
@get external getUrl: request => string = "url"
@get external getRaw: request => 'a = "raw"

// Helper to get a specific header
let getHeader = (req, name) => {
  let headers = getHeaders(req)
  Js.Dict.get(headers, name)
}

@send external send: (reply, 'a) => promise<unit> = "send"
@send external status: (reply, int) => reply = "code"
@send external setHeader: (reply, string, string) => reply = "header"
@send external hijack: reply => unit = "hijack"

// Hook handler types
type hookHandler = (request, reply, unit => unit) => unit
type asyncHookHandler = (request, reply) => promise<unit>

// Fastify instance creation
@module("fastify")
external make: (~options: serverOptions=?, unit) => t = "default"

// Route registration
@send
external get: (t, string, handler) => unit = "get"

@send
external post: (t, string, handler) => unit = "post"

@send
external put: (t, string, handler) => unit = "put"

@send
external delete: (t, string, handler) => unit = "delete"

@send
external patch: (t, string, handler) => unit = "patch"

// Plugin registration
@send
external register: (t, 'a, ~options: 'b=?, unit) => promise<unit> = "register"

// Hook registration - returns the instance for chaining, not a promise
@send external addHook: (t, string, hookHandler) => t = "addHook"

// Error handling
type notFoundHandler = (request, reply) => unit
@send external setNotFoundHandler: (t, notFoundHandler) => unit = "setNotFoundHandler"

@send external setErrorHandler: (t, (exn, request, reply) => promise<unit>) => unit = "setErrorHandler"

// Server lifecycle
@send
external listen: (t, listenOptions) => promise<string> = "listen"

@send
external close: t => promise<unit> = "close"

// Decorators
@send
external decorate: (t, string, 'a) => unit = "decorate"

@get
external server: t => 'a = "server"

// Utility modules for plugins
module Plugin = {
  type pluginFn<'opts> = (t, 'opts, unit) => promise<unit>
  
  @module("fastify-plugin")
  external make: (pluginFn<'opts>, ~options: 'opts=?) => 'a = "default"
}
