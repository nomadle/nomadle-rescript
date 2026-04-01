open Vitest

describe("HeadlessUI", () => {
  test("Dialog should be defined", ctx => {
    ctx->expect(HeadlessUI.Dialog.make)->Expect.toBeTruthy
  })

  test("DialogPanel should be defined", ctx => {
    ctx->expect(HeadlessUI.DialogPanel.make)->Expect.toBeTruthy
  })

  test("DialogTitle should be defined", ctx => {
    ctx->expect(HeadlessUI.DialogTitle.make)->Expect.toBeTruthy
  })

  test("DialogDescription should be defined", ctx => {
    ctx->expect(HeadlessUI.DialogDescription.make)->Expect.toBeTruthy
  })

  test("Listbox should be defined", ctx => {
    ctx->expect(HeadlessUI.Listbox.make)->Expect.toBeTruthy
  })

  test("Menu should be defined", ctx => {
    ctx->expect(HeadlessUI.Menu.make)->Expect.toBeTruthy
  })

  test("Popover should be defined", ctx => {
    ctx->expect(HeadlessUI.Popover.make)->Expect.toBeTruthy
  })

  test("TabGroup should be defined", ctx => {
    ctx->expect(HeadlessUI.TabGroup.make)->Expect.toBeTruthy
  })

  test("Switch should be defined", ctx => {
    ctx->expect(HeadlessUI.Switch.make)->Expect.toBeTruthy
  })

  test("Combobox should be defined", ctx => {
    ctx->expect(HeadlessUI.Combobox.make)->Expect.toBeTruthy
  })

  test("Transition should be defined", ctx => {
    ctx->expect(HeadlessUI.Transition.make)->Expect.toBeTruthy
  })
})
