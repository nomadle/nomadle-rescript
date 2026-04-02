// Core i18next type definitions
type t

// t function type - supports both t(key) and t(key, options) calls
type tFunctionOptions = dict<string>
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
  replace?: dict<string>,
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
@get external resolvedLanguage: t => Nullable.t<string> = "resolvedLanguage"

// Change language methods (multiple signatures)
@send external changeLanguage: (t, string) => promise<tFunction> = "changeLanguage"
@send external changeLanguageWithCallback: (t, string, (Nullable.t<'error>, tFunction) => unit) => promise<tFunction> = "changeLanguage"
@send external changeLanguageDefault: t => promise<tFunction> = "changeLanguage"

// Translation and existence methods
@send external exists: (t, string) => bool = "exists"
@send external existsWithOptions: (t, string, tOptions) => bool = "exists"

// Resource management methods
@send external getResource: (t, string, string, string) => Nullable.t<'a> = "getResource"
@send external addResource: (t, string, string, string, string) => t = "addResource"
@send external addResourceWithOptions: (t, string, string, string, string, addResourceOptions) => t = "addResource"
@send external addResources: (t, string, string, dict<'a>) => t = "addResources"

// Bundle management methods
@send external addResourceBundle: (
  t,
  string,
  string,
  dict<'a>,
  ~overwrite: bool=?, 
  ~nest: bool=?,  
) => t = "addResourceBundle"
@send external addResourceBundleWithOptions: (t, string, string, dict<'a>, bool, bool) => t = "addResourceBundle"
@send external hasResourceBundle: (
  .
  t,         // The i18next instance
  string,    // lng (language)
  string     // ns (namespace)
) => bool = "hasResourceBundle"
@send external getResourceBundle: (t, string, string) => Nullable.t<dict<'a>> = "getResourceBundle"
@send external removeResourceBundle: (t, string, string) => t = "removeResourceBundle"

// Loading methods
@send external loadNamespaces: (t, array<string>) => promise<unit> = "loadNamespaces"
@send external loadNamespacesWithCallback: (t, array<string>, (Nullable.t<'error>, tFunction) => unit) => promise<unit> = "loadNamespaces"
@send external loadLanguages: (t, array<string>) => promise<unit> = "loadLanguages"
@send external loadLanguagesWithCallback: (t, array<string>, (Nullable.t<'error>, tFunction) => unit) => promise<unit> = "loadLanguages"

// Reload methods
@send external reloadResources: t => promise<unit> = "reloadResources"
@send external reloadResourcesWithLangs: (t, array<string>) => promise<unit> = "reloadResources"
@send external reloadResourcesWithLangsAndNs: (t, array<string>, array<string>) => promise<unit> = "reloadResources"

// Data and utility methods
@send external getDataByLanguage: (t, string) => Nullable.t<dict<'a>> = "getDataByLanguage"
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

@send external init: t => promise<tFunction> = "init"
@send external initWithOptions: (t, initOptions) => promise<tFunction> = "init"
@send external initWithCallback: (t, (Nullable.t<'error>, tFunction) => unit) => promise<tFunction> = "init"
@send external initWithOptionsAndCallback: (t, initOptions, (Nullable.t<'error>, tFunction) => unit) => promise<tFunction> = "init"

@send external use: (t, 'plugin) => t = "use"

@send external loadResources: (t, (Nullable.t<'error>) => unit) => unit = "loadResources"
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
