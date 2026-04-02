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
  external make: (~children: React.element, ~context: '{}=?) => React.element =
    "HelmetProvider"
}

// Helmet component - simplified with just what we need
module Helmet = {
  @module("react-helmet-async") @react.component
  external make: (
    ~title: string=?,
    ~titleTemplate: string=?,
    ~defaultTitle: string=?,
    ~htmlAttributes: dict<string>=?,
    ~bodyAttributes: dict<string>=?,
    ~meta: array<dict<string>>=?,
    ~link: array<dict<string>>=?,
    ~script: array<dict<string>>=?,
    ~children: React.element=?,
  ) => React.element = "Helmet"
}

// Server-side rendering
@send external renderStatic: helmetData => helmetServerState = "renderStatic"

// Helper functions for meta tags
let metaName = (name: string, content: string): dict<string> => {
  let meta = (%raw("{}"): dict<string>)
  Dict.set(meta, "name", name)
  Dict.set(meta, "content", content)
  meta
}

let metaProperty = (property: string, content: string): dict<string> => {
  let meta = (%raw("{}"): dict<string>)
  Dict.set(meta, "property", property)
  Dict.set(meta, "content", content)
  meta
}

let metaCharset = (charset: string): dict<string> => {
  let meta = (%raw("{}"): dict<string>)
  Dict.set(meta, "charset", charset)
  meta
}

// Helper functions for link tags
let linkStylesheet = (href: string): dict<string> => {
  let link = (%raw("{}"): dict<string>)
  Dict.set(link, "rel", "stylesheet")
  Dict.set(link, "href", href)
  link
}

let linkCanonical = (href: string): dict<string> => {
  let link = (%raw("{}"): dict<string>)
  Dict.set(link, "rel", "canonical")
  Dict.set(link, "href", href)
  link
}

let linkAlternate = (href: string, hreflang: string): dict<string> => {
  let link = (%raw("{}"): dict<string>)
  Dict.set(link, "rel", "alternate")
  Dict.set(link, "hreflang", hreflang)
  Dict.set(link, "href", href)
  link
}

let script = (~type_=?, ~src=?, ()): dict<string> => {
  let s = (%raw("{}"): dict<string>)
  type_->Belt.Option.forEach(t => Dict.set(s, "type", t))
  src->Belt.Option.forEach(s_ => Dict.set(s, "src", s_))
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
