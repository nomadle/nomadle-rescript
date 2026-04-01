// ReactHelmet.res (or a similar name for your bindings file)

// Define specific types for the attributes within meta, link, script, style tags
// This provides better type safety than just Js.t<{.}>

type htmlAttributes = {
  lang: option<string>, // Example: { lang: "en" }
  // Add other HTML attributes you might set, e.g., dir, amp, etc.
  // If you need arbitrary attributes, you might use Js.t<{.}> directly
}

type bodyAttributes = {
  className: option<string>, // Example: { className: "my-body-class" }
  // Add other body attributes you might set
}

type metaTag = {
  name: option<string>, // e.g., { name: "description", content: "..." }
  property: option<string>, // e.g., { property: "og:title", content: "..." }
  content: string,
  charSet: option<string>, // React uses charSet
  itemProp: option<string>,
  // Add any other attributes common for meta tags
}

type linkTag = {
  rel: string, // e.g., "stylesheet", "canonical", "icon"
  href: string,
  media: option<string>,
  sizes: option<string>,
  @as("type") type_: option<string>,
  @as("crossOrigin") crossOrigin: option<string>,
  // Add any other attributes common for link tags
}

type scriptTag = {
  src: option<string>,
  @as("type") type_: option<string>,
  innerHTML: option<string>, // For inline scripts (e.g., `{ innerHTML: `alert('hello')` }`)
  async: option<bool>,
  defer: option<bool>,
  charSet: option<string>,
  // Add any other attributes common for script tags
}

type styleTag = {
  cssText: string, // For inline styles (e.g., `{ cssText: `body { color: red; }` }`)
}

// Type for the onChangeClientState callback
// (newState, addedTags, removedTags)
type onChangeClientStateType = (
  Js.t<{.}>, // newState: The new state of the head tags
  array<Js.t<{.}> >, // addedTags: Array of tags that were added
  array<Js.t<{.}> > // removedTags: Array of tags that were removed
) => unit


/**
 * ReScript binding for the 'react-helmet' component.
 * Manages document head tags (title, meta, link, script, style, etc.)
 * in a declarative way within your React component tree.
 */
module Helmet = {
  @module("react-helmet") @react.component
  // `make` is the standard convention for binding React components
  // No @new, as React.createElement handles instantiation for you
  external make: (
    ~htmlAttributes: htmlAttributes=?, // Attributes for the <html> tag
    ~title: string=?, // Sets the <title> tag
    ~titleTemplate: string=?, // Template for the title (e.g., "MySite - %s")
    ~defaultTitle: string=?, // Fallback title if no specific title is set
    ~bodyAttributes: bodyAttributes=?, // Attributes for the <body> tag
    ~meta: array<metaTag>=?, // Array of meta tag objects
    ~link: array<linkTag>=?, // Array of link tag objects
    ~script: array<scriptTag>=?, // Array of script tag objects
    ~style: array<styleTag>=?, // Array of style tag objects
    ~base: Js.t<{.}>=?, // Base tag object (e.g., { href: "/base/" })
    ~onChangeClientState: onChangeClientStateType=?, // Callback for client-side changes
    ~children: React.element=?, // Can contain inner <link>, <meta>, etc., or other React elements
    ~key: string=?, // Standard React prop
    ~ref: ReactDOM.domRef=?, // Standard React prop
    unit
  ) => React.element = "Helmet" // "Helmet" because it's a named export { Helmet }
}

// Server-side rendering support
@module("react-helmet")
@scope("Helmet")
external renderStatic: unit => Js.t<{.}> = "renderStatic"


// (* Example Usage *)