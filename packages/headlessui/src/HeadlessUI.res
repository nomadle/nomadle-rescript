/*
  Type-safe idiomatic ReScript bindings for @headlessui/react
  https://headlessui.com/react
  Each component is a PascalCase module with a make function using labeled arguments for props.
  For Dialog, use ~open_ for the open prop (maps to JS 'open').
*/
/*
 @headlessui/react@2.2.4 引入了 use-sync-external-store@1.5.0
 （这正是 SSR 报错 useSyncExternalStore is not a function 的根源）
 */

module Dialog = {
  @module("@headlessui/react") @react.component
  external make: (
    ~open_: bool, // maps to JS 'open'
    ~onClose: bool => unit,
    ~children: React.element,
    ~initialFocus: React.ref<Dom.element>=?,
    ~role: string=?,
    ~autoFocus: bool=?,
    ~transition: bool=?,
  ) => React.element = "Dialog"
}

module DialogPanel = {
  @module("@headlessui/react") @react.component
  external make: (~children: React.element, ~transition: bool=?) => React.element = "DialogPanel"
}

module DialogTitle = {
  @module("@headlessui/react") @react.component
  external make: (~children: React.element) => React.element = "DialogTitle"
}

module DialogDescription = {
  @module("@headlessui/react") @react.component
  external make: (~children: React.element) => React.element = "DialogDescription"
}

module Listbox = {
  @module("@headlessui/react") @react.component
  external make: (
    ~value: 'a,
    ~onChange: 'a => unit,
    ~children: React.element,
    ~by: ('a, 'a) => bool=?,
    ~disabled: bool=?,
    ~invalid: bool=?,
    ~horizontal: bool=?,
    ~form: string=?,
    ~name: string=?,
    ~multiple: bool=?,
  ) => React.element = "Listbox"
}

module ListboxButton = {
  @module("@headlessui/react") @react.component
  external make: (
    ~children: React.element,
    ~className: string=?,
    ~autoFocus: bool=?,
    ~disabled: bool=?,
  ) => React.element = "ListboxButton"
}

module ListboxOptions = {
  @module("@headlessui/react") @react.component
  external make: (
    ~children: React.element,
    ~className: string=?,
    ~portal: bool=?,
    ~modal: bool=?,
    ~transition: bool=?,
  ) => React.element = "ListboxOptions"
}

module ListboxOption = {
  @module("@headlessui/react") @react.component
  external make: (
    ~value: 'a,
    ~children: Js.t<{"active": bool, "selected": bool}> => React.element,
    ~className: string=?,
    ~disabled: bool=?,
  ) => React.element = "ListboxOption"
}

module Menu = {
  @module("@headlessui/react") @react.component
  external make: (~children: React.element) => React.element = "Menu"
}

module MenuButton = {
  @module("@headlessui/react") @react.component
  external make: (
    ~children: React.element,
    ~className: string=?,
    ~disabled: bool=?,
    ~autoFocus: bool=?,
  ) => React.element = "MenuButton"
}

module MenuItems = {
  @module("@headlessui/react") @react.component
  external make: (
    ~children: React.element,
    ~className: string=?,
    ~portal: bool=?,
    ~modal: bool=?,
    ~transition: bool=?,
    ~static: bool=?,
    ~unmount: bool=?,
  ) => React.element = "MenuItems"
}

module MenuItem = {
  @module("@headlessui/react") @react.component
  external make: (
    ~children: React.element,
    ~className: string=?,
    ~disabled: bool=?,
  ) => React.element = "MenuItem"
}

module Popover = {
  @module("@headlessui/react") @react.component
  external make: (~children: React.element) => React.element = "Popover"
}

module PopoverButton = {
  @module("@headlessui/react") @react.component
  external make: (
    ~children: React.element,
    ~className: string=?,
    ~disabled: bool=?,
    ~autoFocus: bool=?,
  ) => React.element = "PopoverButton"
}

module PopoverPanel = {
  @module("@headlessui/react") @react.component
  external make: (
    ~children: React.element,
    ~className: string=?,
    ~focus: bool=?,
    ~portal: bool=?,
    ~modal: bool=?,
    ~transition: bool=?,
    ~static: bool=?,
    ~unmount: bool=?,
  ) => React.element = "PopoverPanel"
}

module TabGroup = {
  @module("@headlessui/react") @react.component
  external make: (
    ~children: React.element,
    ~defaultIndex: int=?,
    ~onChange: int => unit=?,
    ~selectedIndex: int=?,
    ~vertical: bool=?,
    ~manual: bool=?,
  ) => React.element = "TabGroup"
}

module TabList = {
  @module("@headlessui/react") @react.component
  external make: (~children: React.element, ~className: string=?) => React.element = "TabList"
}

module Tab = {
  @module("@headlessui/react") @react.component
  external make: (
    ~children: React.element,
    ~className: string=?,
    ~autoFocus: bool=?,
    ~disabled: bool=?,
  ) => React.element = "Tab"
}

module TabPanels = {
  @module("@headlessui/react") @react.component
  external make: (~children: React.element, ~className: string=?) => React.element = "TabPanels"
}

module TabPanel = {
  @module("@headlessui/react") @react.component
  external make: (
    ~children: React.element,
    ~className: string=?,
    ~id: string=?,
    ~tabIndex: int=?,
  ) => React.element = "TabPanel"
}

module Switch = {
  @module("@headlessui/react") @react.component
  external make: (
    ~checked: bool,
    ~onChange: bool => unit,
    ~children: React.element=?,
    ~className: string=?,
    ~name: string=?,
    ~value: string=?,
    ~form: string=?,
    ~autoFocus: bool=?,
    ~disabled: bool=?,
    ~tabIndex: int=?,
  ) => React.element = "Switch"
}

module Combobox = {
  @module("@headlessui/react") @react.component
  external make: (
    ~value: 'a,
    ~onChange: 'a => unit,
    ~children: React.element,
    ~by: ('a, 'a) => bool=?,
    ~nullable: bool=?,
    ~multiple: bool=?,
    ~disabled: bool=?,
    ~invalid: bool=?,
    ~form: string=?,
    ~name: string=?,
    ~immediate: bool=?,
  ) => React.element = "Combobox"
}

module ComboboxInput = {
  @module("@headlessui/react") @react.component
  external make: (
    ~defaultValue: 'a=?,
    ~value: string=?,
    ~disabled: bool=?,
    ~displayValue: 'a => string=?,
    ~onChange: ReactEvent.Form.t => unit=?,
    ~autoFocus: bool=?,
    ~className: string=?,
    ~placeholder: string=?,
  ) => React.element = "ComboboxInput"
}

module ComboboxButton = {
  @module("@headlessui/react") @react.component
  external make: (
    ~children: React.element,
    ~className: string=?,
    ~autoFocus: bool=?,
    ~disabled: bool=?,
  ) => React.element = "ComboboxButton"
}

module ComboboxOptions = {
  @module("@headlessui/react") @react.component
  external make: (
    ~children: React.element,
    ~className: string=?,
    ~portal: bool=?,
    ~modal: bool=?,
    ~transition: bool=?,
  ) => React.element = "ComboboxOptions"
}

module ComboboxOption = {
  @module("@headlessui/react") @react.component
  external make: (
    ~value: 'a,
    ~children: React.element,
    ~className: string=?,
    ~disabled: bool=?,
    ~order: int=?,
  ) => React.element = "ComboboxOption"
}

module Transition = {
  @module("@headlessui/react") @react.component
  external make: 'props => React.element = "Transition"
}

module TransitionChild = {
  @module("@headlessui/react") @react.component
  external make: 'props => React.element = "TransitionChild"
}
