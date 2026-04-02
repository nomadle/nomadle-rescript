// Supabase bindings for ReScript
type client
type blob = Webapi.Blob.t

@module("@supabase/supabase-js")
external createClient: (string, string) => client = "createClient"

// User and Session types

type userMeta = {
  avatar_url: option<string>,
  display_name: option<string>,
  bio: option<string>,
  email: option<string>,
  email_verified: option<bool>,
  phone_verified: option<bool>,
  sub: option<string>,
}

type appMeta = {
  provider: option<string>,
  providers: option<array<string>>,
}

type identityData = {
  email: option<string>,
  email_verified: option<bool>,
  phone_verified: option<bool>,
  sub: option<string>,
}

type identity = {
  identity_id: option<string>,
  id: option<string>,
  user_id: option<string>,
  identity_data: option<identityData>,
  provider: option<string>,
  last_sign_in_at: option<string>,
  created_at: option<string>,
  updated_at: option<string>,
  email: option<string>,
}

type user = {
  id: string,
  aud: option<string>,
  role: option<string>,
  email: string,
  email_confirmed_at: option<string>,
  phone: option<string>,
  confirmation_sent_at: option<string>,
  confirmed_at: option<string>,
  last_sign_in_at: option<string>,
  app_metadata: option<appMeta>,
  user_metadata: option<userMeta>,
  identities: option<array<identity>>,
  created_at: option<string>,
  updated_at: option<string>,
  is_anonymous: option<bool>,
}

type session = {
  access_token: string,
  token_type: string,
  expires_in: int,
  expires_at: int,
  refresh_token: string,
  user: user,
}

// Error type
type error = {
  message: string,
  status: option<int>,
}

// Auth types
type authData = {
  user: option<user>,
  session: option<session>,
}

type authResponse = {
  data: option<authData>,
  error: Nullable.t<error>,
}

type authError = {
  message: string,
  status: option<int>,
}

// Update user attributes
type userMetadata = {
  "display_name": option<string>,
  "avatar_url": option<string>,
  "bio": option<string>,
}

type updateUserAttributes = {
  "email": option<string>,
  "password": option<string>,
  "phone": option<string>,
  "data": option<userMetadata>,
}

// Auth object type
type auth

// Auth methods
@send
external signUp: (auth, {"email": string, "password": string}) => promise<authResponse> =
  "signUp"
@send
external signInWithPassword: (
  auth,
  {"email": string, "password": string},
) => promise<authResponse> = "signInWithPassword"
@send external signOut: auth => promise<{"error": Nullable.t<error>}> = "signOut"
@send
external resetPasswordForEmail: (
  auth,
  string,
  {"redirectTo": string},
) => promise<{
  "error": Nullable.t<error>,
}> = "resetPasswordForEmail"
@send
external getUser: auth => promise<{
  "data": Nullable.t<{
    "user": option<user>,
  }>,
  "error": Nullable.t<error>,
}> = "getUser"
@send
external getSession: auth => promise<{
  "data": Nullable.t<{
    "session": option<session>,
  }>,
  "error": Nullable.t<error>,
}> = "getSession"
@send external updateUser: (auth, updateUserAttributes) => promise<authResponse> = "updateUser"
@send
external onAuthStateChange: (
  auth,
  (string, Nullable.t<session>) => unit,
) => {"data": Nullable.t<{"subscription": Nullable.t<{"unsubscribe": unit => unit}>}>} =
  "onAuthStateChange"
@send
external signInWithOAuth: (
  auth,
  {"provider": string},
) => promise<{
  "data": option<{
    "url": string,
  }>,
  "error": Nullable.t<error>,
}> = "signInWithOAuth"

// Storage types
type uploadOptions = {
  "cacheControl": option<string>,
  "contentType": option<string>,
  "upsert": option<bool>,
}

type uploadResponse = {
  data: option<{"path": string}>,
  error: Nullable.t<error>,
}

type publicUrlResponse = {data: {"publicUrl": string}}

// Bucket type
type bucket

// Bucket methods
@send
external upload: (bucket, string, Webapi.Blob.t, uploadOptions) => promise<uploadResponse> =
  "upload"
@send external getPublicUrl: (bucket, string) => publicUrlResponse = "getPublicUrl"
@send
external download: (
  bucket,
  string,
) => promise<{
  "data": option<Js.TypedArray2.ArrayBuffer.t>,
  "error": Nullable.t<error>,
}> = "download"
@send
external remove: (
  bucket,
  array<string>,
) => promise<{
  "data": option<array<{"name": string}>>,
  "error": Nullable.t<error>,
}> = "remove"
@send
external list: (
  bucket,
  option<string>,
  option<{
    "limit": option<int>,
    "offset": option<int>,
    "sortBy": option<{
      "column": string,
      "order": string,
    }>,
  }>,
) => promise<{
  "data": option<array<{"name": string, "id": string, "updated_at": string, "created_at": string}>>,
  "error": Nullable.t<error>,
}> = "list"
@send
external createSignedUrl: (
  bucket,
  string,
  int,
) => promise<{
  "data": option<{
    "signedUrl": string,
  }>,
  "error": Nullable.t<error>,
}> = "createSignedUrl"

// Storage type
type storage

// Storage methods
@send external from: (storage, string) => bucket = "from"

// Database types
type postgrestFilterBuilder<'a>
type postgrestQueryBuilder<'a>
type postgrestResponse<'a> = {
  data: option<'a>,
  error: Nullable.t<error>,
  count: option<int>,
}

// Database query builder methods
@send external select: (postgrestQueryBuilder<'a>, string) => postgrestFilterBuilder<'a> = "select"
@send external insert: (postgrestQueryBuilder<'a>, 'b) => postgrestFilterBuilder<'a> = "insert"
@send external update: (postgrestQueryBuilder<'a>, 'b) => postgrestFilterBuilder<'a> = "update"
@send external delete: postgrestQueryBuilder<'a> => postgrestFilterBuilder<'a> = "delete"
@send external upsert: (postgrestQueryBuilder<'a>, 'b) => postgrestFilterBuilder<'a> = "upsert"

// Filter methods
@send external eq: (postgrestFilterBuilder<'a>, string, 'b) => postgrestFilterBuilder<'a> = "eq"
@send external neq: (postgrestFilterBuilder<'a>, string, 'b) => postgrestFilterBuilder<'a> = "neq"
@send external gt: (postgrestFilterBuilder<'a>, string, 'b) => postgrestFilterBuilder<'a> = "gt"
@send external gte: (postgrestFilterBuilder<'a>, string, 'b) => postgrestFilterBuilder<'a> = "gte"
@send external lt: (postgrestFilterBuilder<'a>, string, 'b) => postgrestFilterBuilder<'a> = "lt"
@send external lte: (postgrestFilterBuilder<'a>, string, 'b) => postgrestFilterBuilder<'a> = "lte"
@send
external like: (postgrestFilterBuilder<'a>, string, string) => postgrestFilterBuilder<'a> = "like"
@send
external ilike: (postgrestFilterBuilder<'a>, string, string) => postgrestFilterBuilder<'a> = "ilike"
@send external is_: (postgrestFilterBuilder<'a>, string, 'b) => postgrestFilterBuilder<'a> = "is"
@send
external in_: (postgrestFilterBuilder<'a>, string, array<'b>) => postgrestFilterBuilder<'a> = "in"
@send
external contains: (postgrestFilterBuilder<'a>, string, 'b) => postgrestFilterBuilder<'a> =
  "contains"
@send
external containedBy: (postgrestFilterBuilder<'a>, string, 'b) => postgrestFilterBuilder<'a> =
  "containedBy"
@send external range: (postgrestFilterBuilder<'a>, int, int) => postgrestFilterBuilder<'a> = "range"
@send external single: postgrestFilterBuilder<'a> => postgrestFilterBuilder<'a> = "single"
@send external limit: (postgrestFilterBuilder<'a>, int) => postgrestFilterBuilder<'a> = "limit"
@send
external order: (
  postgrestFilterBuilder<'a>,
  string,
  {"ascending": bool},
) => postgrestFilterBuilder<'a> = "order"

// Execute query - returns promise
external execute: postgrestFilterBuilder<'a> => promise<postgrestResponse<'a>> = "%identity"

// Client methods
@get external auth: client => auth = "auth"
@get external storage: client => storage = "storage"
@get external fromTable: client => string => postgrestQueryBuilder<'a> = "from"

// OAuth sign in - moved after auth type definition

// Environment variables - using Vite's import.meta.env
@val @scope("import.meta.env") external viteSupabaseUrl: option<string> = "VITE_SUPABASE_URL"
@val @scope("import.meta.env") external viteSupabaseKey: option<string> = "VITE_SUPABASE_KEY"

let supabaseUrl = viteSupabaseUrl->Belt.Option.getWithDefault("")
let supabaseKey = viteSupabaseKey->Belt.Option.getWithDefault("")

// Create client instance
let supabase = createClient(supabaseUrl, supabaseKey)
