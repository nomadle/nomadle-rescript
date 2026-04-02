[![npm](https://img.shields.io/npm/v/@nomadle/rescript-headlessui.svg)](https://www.npmjs.com/package/@nomadle/rescript-headlessui)

# @nomadle/rescript-headlessui

ReScript bindings for [@headlessui/react](https://headlessui.com/react) - completely unstyled, fully accessible UI components for React.

## Installation

```bash
npm install @nomadle/rescript-headlessui @headlessui/react
# or
pnpm add @nomadle/rescript-headlessui @headlessui/react
```

Add to your `rescript.json`:

```json
{
  "bs-dependencies": ["@nomadle/rescript-headlessui"]
}
```

## Usage

### Dialog (Modal)

```rescript
open HeadlessUI

@react.component
let make = () => {
  let (isOpen, setIsOpen) = React.useState(() => false)

  <>
    <button onClick={_ => setIsOpen(_ => true)}>
      {"Open Dialog"->React.string}
    </button>
    <Dialog.Dialog open_={isOpen} onClose={_ => setIsOpen(_ => false)}>
      <Dialog.DialogPanel>
        <Dialog.DialogTitle>{"Dialog Title"->React.string}</Dialog.DialogTitle>
        <Dialog.DialogDescription>
          {"This is a dialog description."->React.string}
        </Dialog.DialogDescription>
        <button onClick={_ => setIsOpen(_ => false)}>
          {"Close"->React.string}
        </button>
      </Dialog.DialogPanel>
    </Dialog.Dialog>
  </>
}
```

### Listbox (Select)

```rescript
open HeadlessUI

@react.component
let make = () => {
  let (selected, setSelected) = React.useState(() => "Option 1")
  let options = ["Option 1", "Option 2", "Option 3"]

  <Listbox.Listbox value={selected} onChange={v => setSelected(_ => v)}>
    <Listbox.ListboxButton>
      {selected->React.string}
    </Listbox.ListboxButton>
    <Listbox.ListboxOptions>
      {options
      ->Array.map(option =>
        <Listbox.ListboxOption key={option} value={option}>
          {state =>
            <span className={state["selected"] ? "selected" : ""}>
              {option->React.string}
            </span>
          }
        </Listbox.ListboxOption>
      )
      ->React.array}
    </Listbox.ListboxOptions>
  </Listbox.Listbox>
}
```

### Tabs

```rescript
open HeadlessUI

@react.component
let make = () => {
  <TabGroup.TabGroup>
    <TabGroup.TabList>
      <TabGroup.Tab>{"Tab 1"->React.string}</TabGroup.Tab>
      <TabGroup.Tab>{"Tab 2"->React.string}</TabGroup.Tab>
      <TabGroup.Tab>{"Tab 3"->React.string}</TabGroup.Tab>
    </TabGroup.TabList>
    <TabGroup.TabPanels>
      <TabGroup.TabPanel>{"Content 1"->React.string}</TabGroup.TabPanel>
      <TabGroup.TabPanel>{"Content 2"->React.string}</TabGroup.TabPanel>
      <TabGroup.TabPanel>{"Content 3"->React.string}</TabGroup.TabPanel>
    </TabGroup.TabPanels>
  </TabGroup.TabGroup>
}
```

### Switch (Toggle)

```rescript
open HeadlessUI

@react.component
let make = () => {
  let (enabled, setEnabled) = React.useState(() => false)

  <Switch.Switch
    checked={enabled}
    onChange={v => setEnabled(_ => v)}
    className={enabled ? "switch-on" : "switch-off"}
  >
    <span className="sr-only">{"Toggle"->React.string}</span>
    <span className="toggle" />
  </Switch.Switch>
}
```

### Menu (Dropdown)

```rescript
open HeadlessUI

@react.component
let make = () => {
  <Menu.Menu>
    <Menu.MenuButton>{"Options"->React.string}</Menu.MenuButton>
    <Menu.MenuItems>
      <Menu.MenuItem>{"Account"->React.string}</Menu.MenuItem>
      <Menu.MenuItem>{"Settings"->React.string}</Menu.MenuItem>
      <Menu.MenuItem>{"Logout"->React.string}</Menu.MenuItem>
    </Menu.MenuItems>
  </Menu.Menu>
}
```

### Popover

```rescript
open HeadlessUI

@react.component
let make = () => {
  <Popover.Popover>
    <Popover.PopoverButton>{"Toggle"->React.string}</Popover.PopoverButton>
    <Popover.PopoverPanel>
      {"Popover content here"->React.string}
    </Popover.PopoverPanel>
  </Popover.Popover>
}
```

### Combobox (Autocomplete)

```rescript
open HeadlessUI

@react.component
let make = () => {
  let (selected, setSelected) = React.useState(() => "")
  let (query, setQuery) = React.useState(() => "")

  <Combobox.Combobox value={selected} onChange={v => setSelected(_ => v)}>
    <Combobox.ComboboxInput
      onChange={e => setQuery(_ => ReactEvent.Form.target(e)["value"])}
      displayValue={v => v}
    />
    <Combobox.ComboboxButton>{"▼"->React.string}</Combobox.ComboboxButton>
    <Combobox.ComboboxOptions>
      <Combobox.ComboboxOption value="Option 1">
        {"Option 1"->React.string}
      </Combobox.ComboboxOption>
    </Combobox.ComboboxOptions>
  </Combobox.Combobox>
}
```

## Components

- `Dialog` - Modal dialogs with focus management
- `Listbox` - Custom select dropdowns
- `Menu` - Dropdown menus
- `Popover` - Popover panels with focus management
- `TabGroup` - Accessible tab interfaces
- `Switch` - Toggle switches
- `Combobox` - Autocomplete comboboxes
- `Transition` / `TransitionChild` - Animation transitions

## License

MIT
