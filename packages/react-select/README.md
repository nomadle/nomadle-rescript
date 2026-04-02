[![npm](https://img.shields.io/npm/v/@nomadle/rescript-react-select.svg)](https://www.npmjs.com/package/@nomadle/rescript-react-select)

# @nomadle/rescript-react-select

ReScript bindings for [react-select](https://react-select.com/) - A flexible and beautiful Select Input control for React.

## Installation

```bash
npm install @nomadle/rescript-react-select react-select
# or
pnpm add @nomadle/rescript-react-select react-select
```

Add to your `rescript.json`:

```json
{
  "bs-dependencies": ["@nomadle/rescript-react-select"]
}
```

## Usage

### Basic Select

```rescript
open ReactSelect

let options = [
  {value: "apple", label: "Apple"},
  {value: "banana", label: "Banana"},
  {value: "orange", label: "Orange"},
]

@react.component
let make = () => {
  let (selected, setSelected) = React.useState(() => Js.Nullable.null)

  <Select
    options={options}
    value={selected}
    onChange={opt => setSelected(_ => opt)}
    placeholder="Select a fruit..."
    isClearable={true}
    isSearchable={true}
  />
}
```

### Async Select

```rescript
open ReactSelect

let loadOptions = (inputValue: string) => {
  Fetch.fetch(`/api/search?q=${inputValue}`)
  ->Promise.then(Fetch.Response.json)
  ->Promise.then(json => {
    // Parse and return array of selectOption
    Promise.resolve(options)
  })
}

@react.component
let make = () => {
  <AsyncSelect
    loadOptions={loadOptions}
    placeholder="Search..."
    defaultOptions={[{value: "1", label: "Default"}]}
  />
}
```

### Creatable Select

```rescript
open ReactSelect

@react.component
let make = () => {
  let (options, setOptions) = React.useState(() => [
    {value: "existing", label: "Existing Option"},
  ])

  let handleCreate = (newValue: string) => {
    let newOption = {value: newValue, label: newValue}
    setOptions(prev => prev->Array.concat([newOption]))
    Js.log("Created: " ++ newValue)
  }

  <CreatableSelect
    options={options}
    onCreateOption={handleCreate}
    placeholder="Select or create..."
    isClearable={true}
  />
}
```

## License

MIT
