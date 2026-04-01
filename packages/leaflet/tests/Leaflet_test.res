open Vitest

describe("Leaflet", () => {
  test("PathOptions.make creates correct options", ctx => {
    let options = Leaflet.PathOptions.make(
      ~color="#ff0000",
      ~weight=3,
      ~opacity=1.0,
      ~fillColor="#ff6666",
      ~fillOpacity=0.5,
      ()
    )
    ctx->expect(options)->Expect.toBeTruthy
  })

  test("EventHandlers.make creates correct handlers", ctx => {
    let clickHandler = _ => ()
    let handlers = Leaflet.EventHandlers.make(
      ~click=clickHandler,
      ~mouseover=_ => (),
      ()
    )
    ctx->expect(handlers)->Expect.toBeTruthy
  })

  test("Icon.createDefault creates an icon", ctx => {
    let icon = Leaflet.Icon.createDefault(
      ~iconUrl="/marker.png",
      ~iconSize=(32.0, 32.0),
      ~iconAnchor=(16.0, 32.0),
      ()
    )
    ctx->expect(icon)->Expect.toBeTruthy
  })

  test("Icon.createDivIcon creates a div icon", ctx => {
    let icon = Leaflet.Icon.createDivIcon(
      ~html="<div>Marker</div>",
      ~className="custom-div-icon",
      ()
    )
    ctx->expect(icon)->Expect.toBeTruthy
  })

  test("LatLng.make creates LatLng", ctx => {
    let ll = Leaflet.LatLng.make(51.505, -0.09)
    ctx->expect(ll)->Expect.toBeTruthy
  })

  test("Point.make creates Point", ctx => {
    let pt = Leaflet.Point.make(100.0, 200.0)
    ctx->expect(pt)->Expect.toBeTruthy
  })

  test("LatLngBounds.make creates bounds", ctx => {
    let bounds = Leaflet.LatLngBounds.make((51.5, -0.1), (51.51, -0.11))
    ctx->expect(bounds)->Expect.toBeTruthy
  })
})

describe("Leaflet types", () => {
  test("position type is correct tuple", ctx => {
    let pos: Leaflet.position = (51.505, -0.09)
    ctx->expect(pos)->Expect.toEqual((51.505, -0.09))
  })

  test("bounds type is array of positions", ctx => {
    let bounds: Leaflet.bounds = [(51.5, -0.1), (51.51, -0.11)]
    ctx->expect(Js.Array2.length(bounds))->Expect.toBe(2)
  })
})