// Full ReScript bindings for i18next-browser-languagedetector
// https://github.com/i18next/i18next-browser-languageDetector

// Main language detector type
type t

// i18next service type (for constructor)
type i18nextService

// Custom detector interface - using generic lookup
type customDetector<'a> = {
  name: string,
  lookup: Js.Dict.t<'a> => Js.Nullable.t<string>,
  cacheUserLanguage?: (string, Js.Dict.t<'a>) => unit,
}

// Cookie options type
type cookieOptions = {
  path?: string,
  sameSite?: string,
  secure?: bool,
  httpOnly?: bool,
  maxAge?: int,
}

// Conversion function type
type convertDetectedLanguageFn = string => string

// Complete detector options based on official documentation
// https://github.com/i18next/i18next-browser-languageDetector/blob/master/README.md
type detectorOptions = {
  // order and from where user language should be detected
  order?: array<string>,
  
  // keys or params to lookup language from
  lookupQuerystring?: string,
  lookupCookie?: string,
  lookupLocalStorage?: string,
  lookupSessionStorage?: string,
  lookupFromPathIndex?: int,
  lookupFromSubdomainIndex?: int,
  lookupHash?: string,
  lookupFromHashIndex?: int,
  
  // cache user language on
  caches?: array<string>,
  excludeCacheFor?: array<string>, // languages to not persist
  
  // optional expiry and domain for set cookie
  cookieMinutes?: int,
  cookieDomain?: string,
  
  // optional htmlTag with lang attribute
  htmlTag?: Dom.element,
  
  // optional set cookie options
  cookieOptions?: cookieOptions,
  
  // optional conversion function (use separate setter for function vs string)
  convertDetectedLanguage?: convertDetectedLanguageFn,
}

// Detector options with string converter
type detectorOptionsWithStringConverter = {
  order?: array<string>,
  lookupQuerystring?: string,
  lookupCookie?: string,
  lookupLocalStorage?: string,
  lookupSessionStorage?: string,
  lookupFromPathIndex?: int,
  lookupFromSubdomainIndex?: int,
  lookupHash?: string,
  lookupFromHashIndex?: int,
  caches?: array<string>,
  excludeCacheFor?: array<string>,
  cookieMinutes?: int,
  cookieDomain?: string,
  htmlTag?: Dom.element,
  cookieOptions?: cookieOptions,
  convertDetectedLanguage: string,
}

// Constructor - can be called with or without options
@module("i18next-browser-languagedetector") @new
external make: unit => t = "default"

@module("i18next-browser-languagedetector") @new
external makeWithOptions: detectorOptions => t = "default"

@module("i18next-browser-languagedetector") @new
external makeWithOptionsAndStringConverter: detectorOptionsWithStringConverter => t = "default"

@module("i18next-browser-languagedetector") @new
external makeWithServiceAndOptions: (i18nextService, detectorOptions) => t = "default"

// Static type property
@module("i18next-browser-languagedetector") @val
external detectorType: string = "type"

// Instance properties
@get external type_: t => string = "type"

// Instance methods
// Initialize detector with options
@send external init: (t, detectorOptions) => unit = "init"

// Detect language
@send external detect: t => Js.Nullable.t<string> = "detect"

// Cache user language
@send external cacheUserLanguage: (t, string) => unit = "cacheUserLanguage"

// Add custom detector
@send external addDetector: (t, customDetector<'a>) => t = "addDetector"

// Helper to create detector options with full configuration
let makeDetectorOptions = (
  ~order: array<string>=["querystring", "hash", "cookie", "localStorage", "sessionStorage", "navigator", "htmlTag", "path", "subdomain"],
  ~lookupQuerystring: option<string>=?,
  ~lookupCookie: option<string>=?,
  ~lookupLocalStorage: option<string>=?,
  ~lookupSessionStorage: option<string>=?,
  ~lookupFromPathIndex: option<int>=?,
  ~lookupFromSubdomainIndex: option<int>=?,
  ~lookupHash: option<string>=?,
  ~lookupFromHashIndex: option<int>=?,
  ~caches: array<string>=["localStorage", "cookie"],
  ~excludeCacheFor: array<string>=["cimode"],
  ~cookieMinutes: option<int>=?,
  ~cookieDomain: option<string>=?,
  ~cookieOptions: option<cookieOptions>=?,
  ~convertDetectedLanguage: option<convertDetectedLanguageFn>=?,
  (),
): detectorOptions => {
  {
    ?lookupQuerystring,
    ?lookupCookie,
    ?lookupLocalStorage,
    ?lookupSessionStorage,
    ?lookupFromPathIndex,
    ?lookupFromSubdomainIndex,
    ?lookupHash,
    ?lookupFromHashIndex,
    ?cookieMinutes,
    ?cookieDomain,
    ?cookieOptions,
    ?convertDetectedLanguage,
    order,
    caches,
    excludeCacheFor,
  }
}

// Helper to create detector options with string converter (e.g., "Iso15897")
let makeDetectorOptionsWithStringConverter = (
  ~order: array<string>=["querystring", "hash", "cookie", "localStorage", "sessionStorage", "navigator", "htmlTag", "path", "subdomain"],
  ~lookupQuerystring: option<string>=?,
  ~lookupCookie: option<string>=?,
  ~lookupLocalStorage: option<string>=?,
  ~lookupSessionStorage: option<string>=?,
  ~lookupFromPathIndex: option<int>=?,
  ~lookupFromSubdomainIndex: option<int>=?,
  ~lookupHash: option<string>=?,
  ~lookupFromHashIndex: option<int>=?,
  ~caches: array<string>=["localStorage", "cookie"],
  ~excludeCacheFor: array<string>=["cimode"],
  ~cookieMinutes: option<int>=?,
  ~cookieDomain: option<string>=?,
  ~cookieOptions: option<cookieOptions>=?,
  ~convertDetectedLanguage: string,
  (),
): detectorOptionsWithStringConverter => {
  {
    ?lookupQuerystring,
    ?lookupCookie,
    ?lookupLocalStorage,
    ?lookupSessionStorage,
    ?lookupFromPathIndex,
    ?lookupFromSubdomainIndex,
    ?lookupHash,
    ?lookupFromHashIndex,
    ?cookieMinutes,
    ?cookieDomain,
    ?cookieOptions,
    convertDetectedLanguage,
    order,
    caches,
    excludeCacheFor,
  }
}

// Helper to create cookie options
let makeCookieOptions = (
  ~path: option<string>=?,
  ~sameSite: option<string>=?,
  ~secure: option<bool>=?,
  ~httpOnly: option<bool>=?,
  ~maxAge: option<int>=?,
  (),
): cookieOptions => {
  {
    ?path,
    ?sameSite,
    ?secure,
    ?httpOnly,
    ?maxAge,
  }
}

// Helper to create custom detector
let makeCustomDetector = (
  ~name: string,
  ~lookup: Js.Dict.t<'a> => Js.Nullable.t<string>,
  ~cacheUserLanguage: option<(string, Js.Dict.t<'a>) => unit>=?,
  (),
): customDetector<'a> => {
  {
    name,
    lookup,
    ?cacheUserLanguage,
  }
}

// Common order configurations
let allDetectorsOrder = [
  "querystring",
  "hash",
  "cookie",
  "localStorage",
  "sessionStorage",
  "navigator",
  "htmlTag",
  "path",
  "subdomain",
]

let browserOnlyOrder = ["navigator", "htmlTag"]

let storageOnlyOrder = ["localStorage", "sessionStorage", "cookie"]

let urlOnlyOrder = ["querystring", "path", "subdomain", "hash"]

// Default options
let defaultOptions = makeDetectorOptions()

// Utility function to convert nullable to option
let getLanguageString = (result: Js.Nullable.t<string>): option<string> => {
  result->Js.Nullable.toOption
}

// Export alias
let create = make
let createWithOptions = makeWithOptions
let createWithOptionsAndStringConverter = makeWithOptionsAndStringConverter
