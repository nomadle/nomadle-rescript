open Vitest

describe("I18nextBrowserLanguageDetector", () => {
  describe("Constructor", () => {
    test("make constructor should be defined", ctx => {
      ctx->expect(I18nextBrowserLanguageDetector.make)->Expect.toBeTruthy
    })

    test("create alias should be defined", ctx => {
      ctx->expect(I18nextBrowserLanguageDetector.create)->Expect.toBeTruthy
    })

    test("makeWithOptions should be defined", ctx => {
      ctx->expect(I18nextBrowserLanguageDetector.makeWithOptions)->Expect.toBeTruthy
    })

    test("createWithOptions alias should be defined", ctx => {
      ctx->expect(I18nextBrowserLanguageDetector.createWithOptions)->Expect.toBeTruthy
    })

    test("makeWithOptionsAndStringConverter should be defined", ctx => {
      ctx->expect(I18nextBrowserLanguageDetector.makeWithOptionsAndStringConverter)->Expect.toBeTruthy
    })

    test("createWithOptionsAndStringConverter alias should be defined", ctx => {
      ctx->expect(I18nextBrowserLanguageDetector.createWithOptionsAndStringConverter)->Expect.toBeTruthy
    })

    test("makeWithServiceAndOptions should be defined", ctx => {
      ctx->expect(I18nextBrowserLanguageDetector.makeWithServiceAndOptions)->Expect.toBeTruthy
    })
  })

  describe("detectorOptions", () => {
    test("detector options can be created with minimal config", ctx => {
      let options = I18nextBrowserLanguageDetector.makeDetectorOptions(
        ~order=["localStorage", "navigator"],
        ~caches=["localStorage"],
        ()
      )
      ctx->expect(options.order->Belt.Option.getWithDefault([]))->Expect.toEqual(["localStorage", "navigator"])
      ctx->expect(options.caches->Belt.Option.getWithDefault([]))->Expect.toEqual(["localStorage"])
    })

    test("detector options can be created with full config", ctx => {
      let cookieOpts = I18nextBrowserLanguageDetector.makeCookieOptions(
        ~path="/",
        ~sameSite="strict",
        ()
      )
      let converter = (lng) => lng
      let options = I18nextBrowserLanguageDetector.makeDetectorOptions(
        ~order=["querystring", "cookie", "localStorage"],
        ~lookupQuerystring="lng",
        ~lookupCookie="i18next",
        ~lookupLocalStorage="i18nextLng",
        ~lookupSessionStorage="i18nextLng",
        ~lookupFromPathIndex=0,
        ~lookupFromSubdomainIndex=0,
        ~lookupHash="lng",
        ~lookupFromHashIndex=0,
        ~caches=["localStorage", "cookie"],
        ~excludeCacheFor=["cimode"],
        ~cookieMinutes=10,
        ~cookieDomain="example.com",
        ~cookieOptions=cookieOpts,
        ~convertDetectedLanguage=converter,
        ()
      )
      ctx->expect(options.lookupQuerystring)->Expect.toEqual(Some("lng"))
      ctx->expect(options.lookupCookie)->Expect.toEqual(Some("i18next"))
      ctx->expect(options.lookupLocalStorage)->Expect.toEqual(Some("i18nextLng"))
      ctx->expect(options.caches->Belt.Option.getWithDefault([]))->Expect.toEqual(["localStorage", "cookie"])
    })

    test("detector options with string converter can be created", ctx => {
      let options = I18nextBrowserLanguageDetector.makeDetectorOptionsWithStringConverter(
        ~order=["querystring", "cookie"],
        ~lookupQuerystring="lng",
        ~convertDetectedLanguage="Iso15897",
        ()
      )
      ctx->expect(options.convertDetectedLanguage)->Expect.toEqual("Iso15897")
      ctx->expect(options.lookupQuerystring)->Expect.toEqual(Some("lng"))
      ctx->expect(options.order->Belt.Option.getWithDefault([]))->Expect.toEqual(["querystring", "cookie"])
    })

    test("defaultOptions should be defined", ctx => {
      ctx->expect(I18nextBrowserLanguageDetector.defaultOptions)->Expect.toBeTruthy
    })
  })

  describe("cookieOptions", () => {
    test("cookie options can be created", ctx => {
      let options = I18nextBrowserLanguageDetector.makeCookieOptions(
        ~path="/",
        ~sameSite="strict",
        ~secure=true,
        ~httpOnly=true,
        ~maxAge=3600,
        ()
      )
      ctx->expect(options.path)->Expect.toEqual(Some("/"))
      ctx->expect(options.sameSite)->Expect.toEqual(Some("strict"))
      ctx->expect(options.secure)->Expect.toEqual(Some(true))
      ctx->expect(options.httpOnly)->Expect.toEqual(Some(true))
      ctx->expect(options.maxAge)->Expect.toEqual(Some(3600))
    })
  })

  describe("Order constants", () => {
    test("allDetectorsOrder should have 9 items", ctx => {
      ctx->expect(Array.length(I18nextBrowserLanguageDetector.allDetectorsOrder))->Expect.toBe(9)
    })

    test("browserOnlyOrder should have 2 items", ctx => {
      ctx->expect(Array.length(I18nextBrowserLanguageDetector.browserOnlyOrder))->Expect.toBe(2)
    })

    test("storageOnlyOrder should have 3 items", ctx => {
      ctx->expect(Array.length(I18nextBrowserLanguageDetector.storageOnlyOrder))->Expect.toBe(3)
    })

    test("urlOnlyOrder should have 4 items", ctx => {
      ctx->expect(Array.length(I18nextBrowserLanguageDetector.urlOnlyOrder))->Expect.toBe(4)
    })
  })

  describe("Instance methods", () => {
    test("detect method should be defined", ctx => {
      ctx->expect(I18nextBrowserLanguageDetector.detect)->Expect.toBeTruthy
    })

    test("cacheUserLanguage method should be defined", ctx => {
      ctx->expect(I18nextBrowserLanguageDetector.cacheUserLanguage)->Expect.toBeTruthy
    })

    test("init method should be defined", ctx => {
      ctx->expect(I18nextBrowserLanguageDetector.init)->Expect.toBeTruthy
    })

    test("addDetector method should be defined", ctx => {
      ctx->expect(I18nextBrowserLanguageDetector.addDetector)->Expect.toBeTruthy
    })
  })

  describe("Custom detector", () => {
    test("makeCustomDetector should create detector", ctx => {
      let lookup = (_opts) => Js.Nullable.null
      let detector = I18nextBrowserLanguageDetector.makeCustomDetector(
        ~name="myDetector",
        ~lookup,
        ()
      )
      ctx->expect(detector.name)->Expect.toEqual("myDetector")
    })

    test("makeCustomDetector with cacheUserLanguage", ctx => {
      let lookup = (_opts) => Js.Nullable.null
      let cache = (_lng, _opts) => ()
      let detector = I18nextBrowserLanguageDetector.makeCustomDetector(
        ~name="myDetector",
        ~lookup,
        ~cacheUserLanguage=cache,
        ()
      )
      ctx->expect(detector.name)->Expect.toEqual("myDetector")
    })
  })

  describe("Utility functions", () => {
    test("getLanguageString should convert null to None", ctx => {
      let result = I18nextBrowserLanguageDetector.getLanguageString(Js.Nullable.null)
      ctx->expect(result)->Expect.toBe(None)
    })

    test("getLanguageString should convert value to Some", ctx => {
      let result = I18nextBrowserLanguageDetector.getLanguageString(Js.Nullable.return("en"))
      ctx->expect(result)->Expect.toEqual(Some("en"))
    })
  })

  describe("Type property", () => {
    test("detectorType static property should be defined", ctx => {
      ctx->expect(I18nextBrowserLanguageDetector.detectorType)->Expect.toBeTruthy
    })
  })
})
