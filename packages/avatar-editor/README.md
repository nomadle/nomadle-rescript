# @nomadle/rescript-avatar-editor

ReScript bindings for [react-avatar-editor](https://github.com/mosch/react-avatar-editor) - A Facebook-like avatar / profile picture component.

## Installation

```bash
npm install @nomadle/rescript-avatar-editor react-avatar-editor
# or
pnpm add @nomadle/rescript-avatar-editor react-avatar-editor
```

Add to your `rescript.json`:

```json
{
  "bs-dependencies": ["@nomadle/rescript-avatar-editor"]
}
```

## Usage

### Basic Example

```rescript
open ReactAvatarEditor

@react.component
let make = () => {
  let editorRef = React.useRef(Js.Nullable.null)
  let (scale, setScale) = React.useState(() => 1.0)
  let (position, setPosition) = React.useState(() => {x: 0.5, y: 0.5})

  let handleSave = () => {
    switch getEditorInstance(editorRef) {
    | Some(editor) =>
      let canvas = editor->getImageScaledToCanvas
      // Do something with the canvas
      Js.log(canvas)
    | None => ()
    }
  }

  <div>
    <ReactAvatarEditor
      ref={editorRef}
      image={Url("/path/to/image.jpg")}
      width={200}
      height={200}
      border={50}
      borderRadius={100}
      color={(0, 0, 0, 0.5)}
      scale={scale}
      position={position}
      onPositionChange={pos => setPosition(_ => pos)}
    />
    <input
      type_="range"
      min="1"
      max="2"
      step="0.01"
      value={scale->Float.toString}
      onChange={e => {
        let value = (e->ReactEvent.Form.target)["value"]
        setScale(_ => value->Float.fromString->Option.getOr(1.0))
      }}
    />
    <button onClick={_ => handleSave()}>
      {React.string("Save")}
    </button>
  </div>
}
```

### Using with Blob

```rescript
let handleFileChange = (event, setImageBlob) => {
  let files = event->ReactEvent.Form.target->(t => t["files"])
  switch files->Array.get(0) {
  | Some(file) =>
    let blob = file->Webapi.File.toBlob
    setImageBlob(_ => Some(blob))
  | None => ()
  }
}

@react.component
let make = () => {
  let (imageBlob, setImageBlob) = React.useState(() => None)

  switch imageBlob {
  | Some(blob) =>
    <ReactAvatarEditor
      image={Blob(blob)}
      width={250}
      height={250}
      border={25}
    />
  | None =>
    <input type_="file" accept="image/*" onChange={e => handleFileChange(e, setImageBlob)} />
  }
}
```

### Accessing Editor Methods

```rescript
let editorRef = React.useRef(Js.Nullable.null)

// Get the editor instance
switch getEditorInstance(editorRef) {
| Some(editor) =>
  // Get the image as a canvas element
  let canvas = editor->getImage
  
  // Get the scaled image
  let scaledCanvas = editor->getImageScaledToCanvas
| None => ()
}
```

## License

MIT
