// Corrected type for the 'image' prop using a polymorphic variant

type imageProp =
  | Url(string)
  | Blob(Webapi.Blob.t)
// Type for the 'position' object (x, y coordinates)
type position = {
  x: float,
  y: float,
}

// Type for the image information returned by onLoadSuccess
type imgInfo = {
  x: float,
  y: float,
  width: float,
  height: float,
  resource: string, // URL of the loaded image
}

// Type for the color prop (RGBA array: [r, g, b, a])
type color = (int, int, int, float)

type editorInstace
// Module to access methods exposed by the react-avatar-editor instance via a ref.
let getEditorInstance = (ref: React.ref<Nullable.t<Dom.element>>): option<editorInstace> => {
  switch Nullable.toOption(ref.current) {
  | Some(value) => Some((Obj.magic(value): editorInstace))
  | None => None
  }
}
// Editor component binding

@send external getImage: editorInstace => Dom.htmlCanvasElement = "getImage"
@send
external getImageScaledToCanvas: editorInstace => Dom.htmlCanvasElement = "getImageScaledToCanvas"

@module("react-avatar-editor") @react.component
external make: (
  ~image: imageProp,
  ~width: int,
  ~height: int,
  ~border: 'border=?, // This remains a type variable for untagged JS union
  ~borderRadius: int=?,
  ~color: color=?,
  ~scale: float=?,
  ~rotate: float=?,
  ~position: position=?,
  ~crossOrigin: string=?,
  ~backgroundColor: string=?,
  ~style: ReactDOM.Style.t=?,
  ~className: string=?,
  ~disableBoundaryChecks: bool=?,
  ~disableHiDPIScaling: bool=?,
  ~onLoadFailure: ReactEvent.Synthetic.t => unit=?,
  ~onLoadSuccess: imgInfo => unit=?,
  ~onImageReady: ReactEvent.Synthetic.t => unit=?,
  ~onMouseUp: unit => unit=?,
  ~onMouseMove: ReactEvent.Mouse.t => unit=?,
  ~onImageChange: unit => unit=?,
  ~onPositionChange: position => unit=?,
  ~ref: React.ref<Nullable.t<editorInstace>>=?,
) => React.element = "default"
