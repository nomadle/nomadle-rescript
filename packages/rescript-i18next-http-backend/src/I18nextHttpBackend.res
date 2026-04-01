// Simplified ReScript bindings for i18next-http-backend - only what we need

// Main HTTP Backend type
type t

// Basic backend options we actually use
type backendOptions = {
  loadPath: string,
  crossDomain: bool,
  withCredentials: bool,
}

// Constructor
@module("i18next-http-backend") @new
external make: unit => t = "default"

// Properties we need
@get external type_: t => string = "type"

// Helper to create backend options
let makeBackendOptions = (~loadPath: string, ~crossDomain: bool=false, ~withCredentials: bool=false, ()): backendOptions => {
  {
    loadPath: loadPath,
    crossDomain: crossDomain,
    withCredentials: withCredentials,
  }
}

// Common configurations
let apiLoadPath = "/api/locales/{{lng}}/{{ns}}.json"
let defaultOptions = makeBackendOptions(~loadPath=apiLoadPath, ())

// Export aliases
let create = make
