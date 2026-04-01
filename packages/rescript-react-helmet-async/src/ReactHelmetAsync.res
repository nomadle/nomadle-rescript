// Simplified ReScript bindings for react-helmet-async - only what we need

// Core types
type helmetData

// Server-side rendering types
type helmetTag = {
  toString: unit => string,
}

type helmetServerState = {
  title: helmetTag,
  meta: helmetTag,
  link: helmetTag,
  script: helmetTag,
  style: helmetTag,
  htmlAttributes: helmetTag,
  bodyAttributes: helmetTag,
}

// HelmetData creation
@module("react-helmet-async") @new
external createHelmetData: unit => helmetData = "HelmetData"

type helmetContext = {
  helmet: option<helmetServerState> // 'option' because it's 'helmet?:'
}
// HelmetProvider component


type props = {
  context?: option<helmetContext>, // Optional, so it's `option<...>`
  children: React.element,
}

// this create unnamed function, but not able to render jsx
module HelmetProvider = {
@module("react-helmet-async") @new// Specifies the JavaScript module to import from
external make: (
  props,         // Corresponds to PropsWithChildren
) => React.element  =
    "HelmetProvider"
}

module HelmetProviderSSR = {
  @module("react-helmet-async")
  external make: (~children: React.element, ~context: Js.t<{.}>=?) => React.element =
    "HelmetProvider"
}

// Helmet component - simplified with just what we need
module Helmet = {
  @module("react-helmet-async") @react.component
  external make: (
    ~title: string=?,
    ~titleTemplate: string=?,
    ~defaultTitle: string=?,
    ~htmlAttributes: Js.Dict.t<string>=?,
    ~bodyAttributes: Js.Dict.t<string>=?,
    ~meta: array<Js.Dict.t<string>>=?,
    ~link: array<Js.Dict.t<string>>=?,
    ~script: array<Js.Dict.t<string>>=?,
    ~children: React.element=?,
  ) => React.element = "Helmet"
}

// Server-side rendering
@send external renderStatic: helmetData => helmetServerState = "renderStatic"

// Helper functions for meta tags
let metaName = (name: string, content: string): Js.Dict.t<string> => {
  let meta = Js.Dict.empty()
  Js.Dict.set(meta, "name", name)
  Js.Dict.set(meta, "content", content)
  meta
}

let metaProperty = (property: string, content: string): Js.Dict.t<string> => {
  let meta = Js.Dict.empty()
  Js.Dict.set(meta, "property", property)
  Js.Dict.set(meta, "content", content)
  meta
}

let metaCharset = (charset: string): Js.Dict.t<string> => {
  let meta = Js.Dict.empty()
  Js.Dict.set(meta, "charset", charset)
  meta
}

// Helper functions for link tags
let linkStylesheet = (href: string): Js.Dict.t<string> => {
  let link = Js.Dict.empty()
  Js.Dict.set(link, "rel", "stylesheet")
  Js.Dict.set(link, "href", href)
  link
}

let linkCanonical = (href: string): Js.Dict.t<string> => {
  let link = Js.Dict.empty()
  Js.Dict.set(link, "rel", "canonical")
  Js.Dict.set(link, "href", href)
  link
}

let linkAlternate = (href: string, hreflang: string): Js.Dict.t<string> => {
  let link = Js.Dict.empty()
  Js.Dict.set(link, "rel", "alternate")
  Js.Dict.set(link, "hreflang", hreflang)
  Js.Dict.set(link, "href", href)
  link
}

let script = (~type_=?, ~src=?, ()): Js.Dict.t<string> => {
  let s = Js.Dict.empty()
  type_->Belt.Option.forEach(t => Js.Dict.set(s, "type", t))
  src->Belt.Option.forEach(s_ => Js.Dict.set(s, "src", s_))
  s
}

// Common meta tag helpers
module Meta = {
  let description = (content: string) => metaName("description", content)
  let keywords = (content: string) => metaName("keywords", content)
  let author = (content: string) => metaName("author", content)
  let viewport = (content: string) => metaName("viewport", content)
  let robots = (content: string) => metaName("robots", content)
  let themeColor = (content: string) => metaName("theme-color", content)

  // Open Graph tags
  let ogTitle = (content: string) => metaProperty("og:title", content)
  let ogDescription = (content: string) => metaProperty("og:description", content)
  let ogImage = (content: string) => metaProperty("og:image", content)
  let ogUrl = (content: string) => metaProperty("og:url", content)
  let ogType = (content: string) => metaProperty("og:type", content)
  let ogSiteName = (content: string) => metaProperty("og:site_name", content)
  let ogLocale = (content: string) => metaProperty("og:locale", content)

  // Twitter Card tags
  let twitterCard = (content: string) => metaName("twitter:card", content)
  let twitterSite = (content: string) => metaName("twitter:site", content)
  let twitterCreator = (content: string) => metaName("twitter:creator", content)
  let twitterTitle = (content: string) => metaName("twitter:title", content)
  let twitterDescription = (content: string) => metaName("twitter:description", content)
  let twitterImage = (content: string) => metaName("twitter:image", content)

  let defaultViewport = viewport("width=device-width, initial-scale=1")
}

// Server utilities
module Server = {
  let renderStatic = renderStatic

  let getTitle = (state: helmetServerState): string => {
    state.title.toString()
  }

  let getMeta = (state: helmetServerState): string => {
    state.meta.toString()
  }

  let getLink = (state: helmetServerState): string => {
    state.link.toString()
  }

  let getScript = (state: helmetServerState): string => {
    state.script.toString()
  }

  let getStyle = (state: helmetServerState): string => {
    state.style.toString()
  }

  let getHtmlAttributes = (state: helmetServerState): string => {
    state.htmlAttributes.toString()
  }

  let getBodyAttributes = (state: helmetServerState): string => {
    state.bodyAttributes.toString()
  }
}

// Convenience exports
let create = createHelmetData
