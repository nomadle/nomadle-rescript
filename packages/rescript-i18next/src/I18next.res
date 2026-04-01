// Core i18next type definitions
type t

// t function type - supports both t(key) and t(key, options) calls
type tFunctionOptions = Js.Dict.t<string>
type tFunction = (
  string,
  ~options: tFunctionOptions=?,
) => string

type initOptions = {
  fallbackLng?: string,
  debug?: bool,
  lng?: string,
  supportedLngs?: array<string>,
  defaultNS?: string,
  ns?: array<string>,
  backend?: {"loadPath": string},
  detection?: {
    "order": array<string>,
    "caches": array<string>,
    "lookupFromPathIndex": int,
    "checkWhitelist": bool,
  },
  react?: {
    "useSuspense": bool,
    "bindI18n": string,
    "bindI18nStore": string,
    "transEmptyNodeValue": string,
    "transSupportBasicHtmlNodes": bool,
    "transKeepBasicHtmlNodesFor": array<string>,
  },
  interpolation?: {
    "escapeValue": bool,
    "returnObjects": bool,
  },
  keySeparator?: string,
  nsSeparator?: string,
  pluralSeparator?: string,
  contextSeparator?: string,
}

type tOptions = {
  returnObjects?: bool,
  defaultValue?: string,
  count?: int,
  context?: string,
  replace?: Js.Dict.t<string>,
  lng?: string,
  fallbackLng?: string,
  ns?: string,
  keySeparator?: string,
}

type addResourceOptions = {
  keySeparator?: string,
  silent?: bool,
}

// Core i18n instance methods and properties
@get external language: t => string = "language"
@get external languages: t => array<string> = "languages"
@get external resolvedLanguage: t => Js.Nullable.t<string> = "resolvedLanguage"

// Change language methods (multiple signatures)
@send external changeLanguage: (t, string) => Js.Promise.t<tFunction> = "changeLanguage"
@send external changeLanguageWithCallback: (t, string, (Js.Nullable.t<'error>, tFunction) => unit) => Js.Promise.t<tFunction> = "changeLanguage"
@send external changeLanguageDefault: t => Js.Promise.t<tFunction> = "changeLanguage"

// Translation and existence methods
@send external exists: (t, string) => bool = "exists"
@send external existsWithOptions: (t, string, tOptions) => bool = "exists"

// Resource management methods
@send external getResource: (t, string, string, string) => Js.Nullable.t<'a> = "getResource"
@send external addResource: (t, string, string, string, string) => t = "addResource"
@send external addResourceWithOptions: (t, string, string, string, string, addResourceOptions) => t = "addResource"
@send external addResources: (t, string, string, Js.Dict.t<'a>) => t = "addResources"

// Bundle management methods
@send external addResourceBundle: (
  t,
  string,
  string,
  Js.Dict.t<'a>,
  ~overwrite: bool=?, 
  ~nest: bool=?,  
) => t = "addResourceBundle"
@send external addResourceBundleWithOptions: (t, string, string, Js.Dict.t<'a>, bool, bool) => t = "addResourceBundle"
@send external hasResourceBundle: (
  .
  t,         // The i18next instance
  string,    // lng (language)
  string     // ns (namespace)
) => bool = "hasResourceBundle"
@send external getResourceBundle: (t, string, string) => Js.Nullable.t<Js.Dict.t<'a>> = "getResourceBundle"
@send external removeResourceBundle: (t, string, string) => t = "removeResourceBundle"

// Loading methods
@send external loadNamespaces: (t, array<string>) => Js.Promise.t<unit> = "loadNamespaces"
@send external loadNamespacesWithCallback: (t, array<string>, (Js.Nullable.t<'error>, tFunction) => unit) => Js.Promise.t<unit> = "loadNamespaces"
@send external loadLanguages: (t, array<string>) => Js.Promise.t<unit> = "loadLanguages"
@send external loadLanguagesWithCallback: (t, array<string>, (Js.Nullable.t<'error>, tFunction) => unit) => Js.Promise.t<unit> = "loadLanguages"

// Reload methods
@send external reloadResources: t => Js.Promise.t<unit> = "reloadResources"
@send external reloadResourcesWithLangs: (t, array<string>) => Js.Promise.t<unit> = "reloadResources"
@send external reloadResourcesWithLangsAndNs: (t, array<string>, array<string>) => Js.Promise.t<unit> = "reloadResources"

// Data and utility methods
@send external getDataByLanguage: (t, string) => Js.Nullable.t<Js.Dict.t<'a>> = "getDataByLanguage"
@send external hasLoadedNamespace: (t, string) => bool = "hasLoadedNamespace"
@send external dir: (t, string) => string = "dir"
@send external dirDefault: t => string = "dir"

// Event handling
@send external on: (t, string, 'callback) => unit = "on"
@send external off: (t, string) => unit = "off"
@send external offWithCallback: (t, string, 'callback) => unit = "off"

// Instance management
@send external createInstance: (t, initOptions) => t = "createInstance"
@send external createInstanceDefault: t => t = "createInstance"
@send external cloneInstance: (t, initOptions) => t = "cloneInstance"
@send external cloneInstanceDefault: t => t = "cloneInstance"

@module("i18next") @val
external i18n: t = "default"

@send external init: t => Js.Promise.t<tFunction> = "init"
@send external initWithOptions: (t, initOptions) => Js.Promise.t<tFunction> = "init"
@send external initWithCallback: (t, (Js.Nullable.t<'error>, tFunction) => unit) => Js.Promise.t<tFunction> = "init"
@send external initWithOptionsAndCallback: (t, initOptions, (Js.Nullable.t<'error>, tFunction) => unit) => Js.Promise.t<tFunction> = "init"

@send external use: (t, 'plugin) => t = "use"

@send external loadResources: (t, (Js.Nullable.t<'error>) => unit) => unit = "loadResources"
@send external loadResourcesDefault: t => unit = "loadResources"

// Helper to create tOptions
let makeTOptions = (
  ~returnObjects=?,
  ~defaultValue=?,
  ~count=?,
  ~context=?,
  ~replace=?,
  ~lng=?,
  ~fallbackLng=?,
  ~ns=?,
  ~keySeparator=?,
  (),
): tOptions => {
  {
    ?returnObjects,
    ?defaultValue,
    ?count,
    ?context,
    ?replace,
    ?lng,
    ?fallbackLng,
    ?ns,
    ?keySeparator,
  }
}

// Helper to create initOptions
let makeInitOptions = (
  ~fallbackLng=?,
  ~debug=?,
  ~lng=?,
  ~supportedLngs=?,
  ~defaultNS=?,
  ~ns=?,
  ~backend=?,
  ~detection=?,
  ~react=?,
  ~interpolation=?,
  ~keySeparator=?,
  ~nsSeparator=?,
  ~pluralSeparator=?,
  ~contextSeparator=?,
  (),
): initOptions => {
  {
    ?fallbackLng,
    ?debug,
    ?lng,
    ?supportedLngs,
    ?defaultNS,
    ?ns,
    ?backend,
    ?detection,
    ?react,
    ?interpolation,
    ?keySeparator,
    ?nsSeparator,
    ?pluralSeparator,
    ?contextSeparator,
  }
}

// Helper to create addResourceOptions
let makeAddResourceOptions = (
  ~keySeparator=?,
  ~silent=?,
  (),
): addResourceOptions => {
  {
    ?keySeparator,
    ?silent,
  }
}

// Helper to create addResourceOptions
let makeAddResourceOptions = (
  ~keySeparator=?,
  ~silent=?,
  (),
): addResourceOptions => {
  {
    ?keySeparator,
    ?silent,
  }
}
