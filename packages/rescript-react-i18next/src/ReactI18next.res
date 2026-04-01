// ReScript bindings for react-i18next
// https://react.i18next.com/

// Import i18n type from I18next module
type i18n = I18next.t

type tFunctionOptions = Js.Dict.t<string>
type tFunction = (
  string,
  ~options: tFunctionOptions=?,
) => string

// React-specific types
type useTranslationResponse = {
  t: tFunction,
  i18n: i18n,
  ready: bool,
}

// useTranslation hook
@module("react-i18next")
external useTranslation: (~ns: string=?, ~options: 'opts=?) => useTranslationResponse = "useTranslation"

// Trans component for rendering translations with JSX
module Trans = {
  @module("react-i18next") @react.component
  external make: (
    ~i18nKey: string,
    ~values: Js.Dict.t<string>=?,
    ~components: array<React.element>=?,
    ~children: React.element=?,
  ) => React.element = "Trans"
}

// Translation render prop component
module Translation = {
  type renderProps = {
    t: tFunction,
    i18n: i18n,
    lng: string,
  }
  
  @module("react-i18next") @react.component
  external make: (
    ~ns: string=?,
    ~i18n: i18n=?,
    ~children: renderProps => React.element,
  ) => React.element = "Translation"
}

// I18nextProvider component
module I18nextProvider = {
  @module("react-i18next") @react.component
  external make: (
    ~i18n: i18n,
    ~children: React.element=?,
  ) => React.element = "I18nextProvider"
}

// withTranslation HOC
@module("react-i18next")
external withTranslation: string => ('component => 'component) = "withTranslation"

// SSR related
@module("react-i18next")
external useSSR: (Js.Dict.t<'a>, string) => unit = "useSSR"

// initReactI18next plugin
@module("react-i18next") @val
external initReactI18next: 'plugin = "initReactI18next"

// I18n Context
type i18nContextValue = {i18n: i18n}

@module("react-i18next") @val
external i18nContext: React.Context.t<i18nContextValue> = "I18nContext"

// Utility functions
@module("react-i18next")
external setDefaults: 'reactOptions => unit = "setDefaults"

@module("react-i18next")
external getDefaults: unit => 'reactOptions = "getDefaults"

@module("react-i18next")
external setI18n: i18n => unit = "setI18n"

@module("react-i18next")
external getI18n: unit => i18n = "getI18n"

// Get language from i18n instance
@get external language: i18n => string = "language"

// Change language
@send external changeLanguage: (i18n, string) => Js.Promise.t<tFunction> = "changeLanguage"

// Check if resource bundle exists
@send external hasResourceBundle: (i18n, string, string) => bool = "hasResourceBundle"

// Load namespaces
@send external loadNamespaces: (i18n, array<string>) => Js.Promise.t<unit> = "loadNamespaces"

// Identity function for i18n type
let i = (x: i18n) => x
