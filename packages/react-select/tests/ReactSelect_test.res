open Vitest

describe("ReactSelect", () => {
  test("Select should be defined", ctx => {
    ctx->expect(ReactSelect.Select.make)->Expect.toBeTruthy
  })

  test("AsyncSelect should be defined", ctx => {
    ctx->expect(ReactSelect.AsyncSelect.make)->Expect.toBeTruthy
  })

  test("CreatableSelect should be defined", ctx => {
    ctx->expect(ReactSelect.CreatableSelect.make)->Expect.toBeTruthy
  })

  test("selectOption type should work", ctx => {
    let option: ReactSelect.selectOption = {
      value: "option1",
      label: "Option 1",
    }
    
    ctx->expect(option.value)->Expect.toBe("option1")
    ctx->expect(option.label)->Expect.toBe("Option 1")
  })

  test("options array should work", ctx => {
    let options: array<ReactSelect.selectOption> = [
      {value: "a", label: "Option A"},
      {value: "b", label: "Option B"},
      {value: "c", label: "Option C"},
    ]
    
    ctx->expect(Js.Array2.length(options))->Expect.toBe(3)
    ctx->expect(options[0].label)->Expect.toBe("Option A")
  })

  test("actionMeta type should work", ctx => {
    let meta: ReactSelect.actionMeta = {
      action: #"select-option",
      option: Some({value: "test", label: "Test"}),
    }
    
    ctx->expect(meta.action)->Expect.toBe(#"select-option")
  })

  test("actionMeta clear action should work", ctx => {
    let meta: ReactSelect.actionMeta = {
      action: #clear,
    }
    
    ctx->expect(meta.action)->Expect.toBe(#clear)
  })
})
