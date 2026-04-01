# @nomadle/rescript-advertising

ReScript bindings for [react-advertising](https://github.com/technology-ebay-de/react-advertising) - Display advertising via Google Ad Manager with Prebid.js support.

## Installation

```bash
npm install @nomadle/rescript-advertising react-advertising
# or
pnpm add @nomadle/rescript-advertising react-advertising
```

Add to your `rescript.json`:

```json
{
  "bs-dependencies": ["@nomadle/rescript-advertising"]
}
```

## Usage

```rescript
open ReactAdvertising

// Define ad slots
let slots = [
  Config.makeSlot(
    ~id="ad-banner",
    ~path="/1234567/ad-unit",
    ~sizes=[Config.Sizes.leaderboard, Config.Sizes.mediumRectangle],
    ~targeting=Js.Dict.fromArray([("key", "value")]),
  ),
]

// Create config
let config = Config.make(~slots)

// Wrap your app with Provider
@react.component
let make = () => {
  <Provider config={config}>
    <div>
      <Slot id="ad-banner" className="ad-container" />
    </div>
  </Provider>
}
```

## License

MIT
