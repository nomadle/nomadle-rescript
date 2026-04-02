// ReScript bindings for react-advertising
// https://www.npmjs.com/package/react-advertising

// Configuration types for ad slots
type adSlotConfig = {
  id: string,
  path: string,
  sizes: array<(int, int)>,
  prebid?: array<{"mediaTypes": {"banner": {"sizes": array<(int, int)>}}, "bids": array<{"bidder": string, "params": JSON.t}>}>,
  targeting?: dict<string>,
  sizeMapping?: array<{"viewport": array<int>, "sizes": array<(int, int)>}>,
  lazyLoad?: bool,
}

// Main configuration type
type config = {
  slots: array<adSlotConfig>,
  prebid?: {"timeout": int},
}

// AdvertisingProvider component
// Usage: <ReactAdvertising.Provider config={config}>...</ReactAdvertising.Provider>
@module("react-advertising")
external makeProvider: (
  ~config: config,
  ~children: React.element,
  ~active: bool=?,
  ~collapseEmptyDivs: bool=?,
  ~onError: JsExn.t => unit=?,
) => React.element = "AdvertisingProvider"

// AdSlot component
// Usage: <ReactAdvertising.Slot id="ad-id" />
@module("react-advertising")
external makeSlot: (
  ~id: string,
  ~className: string=?,
  ~style: ReactDOM.Style.t=?,
) => React.element = "AdSlot"

// Helper module for easier usage
module Provider = {
  @react.component
  let make = (
    ~config: config,
    ~active=true,
    ~collapseEmptyDivs=false,
    ~onError=?,
    ~children,
  ) => {
    makeProvider(
      ~config=config,
      ~children=children,
      ~active=active,
      ~collapseEmptyDivs=collapseEmptyDivs,
      ~onError=?onError,
    )
  }
}

module Slot = {
  @react.component
  let make = (~id: string, ~className=?, ~style=?) => {
    makeSlot(~id=id, ~className=?className, ~style=?style)
  }
}

// Utility functions for creating configurations
module Config = {
  let make = (~slots, ~prebid=?) => {
    switch prebid {
    | Some(prebidConfig) => {
        let config: config = {
          slots: slots,
          prebid: prebidConfig,
        }
        config
      }
    | None => {
        let config: config = {
          slots: slots,
        }
        config
      }
    }
  }

  let makeSlot = (
    ~id: string,
    ~path: string,
    ~sizes: array<(int, int)>,
    ~prebid=?,
    ~targeting=?,
    ~sizeMapping=?,
    ~lazyLoad=false,
  ) => {
    // Build slot config with only provided optional fields
    let baseSlot = {
      id: id,
      path: path,
      sizes: sizes,
      lazyLoad: lazyLoad,
    }
    
    // Add optional fields if provided
    let withPrebid = switch prebid {
    | Some(p) => {...baseSlot, prebid: p}
    | None => baseSlot
    }
    
    let withTargeting = switch targeting {
    | Some(t) => {...withPrebid, targeting: t}
    | None => withPrebid
    }
    
    let withSizeMapping = switch sizeMapping {
    | Some(s) => {...withTargeting, sizeMapping: s}
    | None => withTargeting
    }
    
    withSizeMapping
  }

  // Common ad sizes
  module Sizes = {
    let leaderboard = (728, 90)
    let mediumRectangle = (300, 250)
    let wideSkyscraper = (160, 600)
    let billboard = (970, 250)
    let mobileBanner = (320, 50)
    let halfPage = (300, 600)
  }
}
