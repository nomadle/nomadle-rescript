[![npm](https://img.shields.io/npm/v/@nomadle/rescript-supabase.svg)](https://www.npmjs.com/package/@nomadle/rescript-supabase)

# @nomadle/rescript-supabase

ReScript bindings for [@supabase/supabase-js](https://github.com/supabase/supabase-js) - the official Supabase JavaScript client.

## Features

- ✅ Authentication (signUp, signIn, signOut, OAuth, etc.)
- ✅ Database queries (PostgREST)
- ✅ Storage operations
- ✅ Realtime subscriptions
- ✅ Type-safe query builder

## Installation

```bash
npm install @nomadle/rescript-supabase @supabase/supabase-js
# or
pnpm add @nomadle/rescript-supabase @supabase/supabase-js
```

Add to your `rescript.json`:

```json
{
  "bs-dependencies": ["@nomadle/rescript-supabase"]
}
```

## Usage

### Create Client

```rescript
open Supabase

let supabaseUrl = "https://your-project.supabase.co"
let supabaseKey = "your-anon-key"

let supabase = createClient(supabaseUrl, supabaseKey)
```

### Authentication

```rescript
// Sign up
let signUp = async () => {
  let response = await supabase->auth->signUp({
    "email": "user@example.com",
    "password": "password123"
  })
  
  switch response.error->Js.Nullable.toOption {
  | Some(error) => Js.log(error.message)
  | None => Js.log("Success!")
  }
}

// Sign in
let signIn = async () => {
  let response = await supabase->auth->signInWithPassword({
    "email": "user@example.com",
    "password": "password123"
  })
  // Handle response...
}

// OAuth sign in
let signInWithGoogle = () => {
  supabase->auth->signInWithOAuth({"provider": "google"})
}
```

### Database Queries

```rescript
// Select all
let getUsers = async () => {
  let response = await supabase
    ->fromTable("users")
    ->select("*")
    ->execute
    
  response.data
}

// Filter
let getActiveUsers = async () => {
  let response = await supabase
    ->fromTable("users")
    ->select("*")
    ->eq("active", true)
    ->order("created_at", {"ascending": false})
    ->limit(10)
    ->execute
    
  response.data
}

// Insert
let createUser = async (user) => {
  let response = await supabase
    ->fromTable("users")
    ->insert(user)
    ->execute
}
```

### Storage

```rescript
// Upload file
let uploadFile = async (file, path) => {
  let response = await supabase
    ->storage
    ->from("avatars")
    ->upload(path, file, {"upsert": Some(true)})
}

// Get public URL
let getAvatarUrl = (path) => {
  supabase
    ->storage
    ->from("avatars")
    ->getPublicUrl(path)
}
```

## License

MIT
