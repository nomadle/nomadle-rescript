// ReScript bindings for react-select
// Simplified bindings using Js.t for complex types

type selectOption = {
  value: string,
  label: string,
}

// Action meta types for onChange handler
// https://react-select.com/typescript

type actionMetaAction = [
  | #"select-option"
  | #"deselect-option"
  | #"remove-value"
  | #"pop-value"
  | #"set-value"
  | #"clear"
  | #"create-option"
]

type actionMeta = {
  action: actionMetaAction,
  option?: option<selectOption>,
  removedValue?: selectOption,
  name?: string,
}

module Select = {
  type value = selectOption
  
  @module("react-select") @react.component
  external make: (
    ~options: array<selectOption>,
    ~value: Js.Nullable.t<value>=?,
    ~onChange: Js.Nullable.t<selectOption> => unit=?,
    ~placeholder: string=?,
    ~isClearable: bool=?,
    ~isSearchable: bool=?,
    ~isDisabled: bool=?,
    ~className: string=?,
    ~classNamePrefix: string=?,
  ) => React.element = "default"
}

module AsyncSelect = {
  @module("react-select/async") @react.component
  external make: (
    ~loadOptions: string => Js.Promise.t<array<selectOption>>,
    ~value: selectOption=?,
    ~onChange: Js.Nullable.t<selectOption> => unit=?,
    ~placeholder: string=?,
    ~isClearable: bool=?,
    ~isSearchable: bool=?,
    ~isDisabled: bool=?,
    ~defaultOptions: array<selectOption>=?,
    ~className: string=?,
    ~classNamePrefix: string=?,
  ) => React.element = "default"
}

module CreatableSelect = {
  @module("react-select/creatable") @react.component
  external make: (
    ~options: array<selectOption>,
    ~value: selectOption=?,
    ~onChange: Js.Nullable.t<selectOption> => unit=?,
    ~onCreateOption: string => unit=?,
    ~placeholder: string=?,
    ~isClearable: bool=?,
    ~isSearchable: bool=?,
    ~isDisabled: bool=?,
    ~className: string=?,
    ~classNamePrefix: string=?,
  ) => React.element = "default"
}
