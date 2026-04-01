# @nomadle/rescript-mongoose

ReScript bindings for [Mongoose](https://mongoosejs.com/) - elegant MongoDB object modeling for Node.js.

## Features

- ✅ Connection management (connect, disconnect, connection state)
- ✅ Schema definition with type helpers
- ✅ Model creation with get-or-create pattern
- ✅ CRUD operations (create, find, update, delete)
- ✅ Query building with chaining
- ✅ Aggregation pipeline support
- ✅ Document methods and utilities

## Installation

```bash
npm install @nomadle/rescript-mongoose mongoose
# or
pnpm add @nomadle/rescript-mongoose mongoose
```

Add to your `rescript.json`:

```json
{
  "bs-dependencies": ["@nomadle/rescript-mongoose"]
}
```

## Usage

### Connection

```rescript
open Mongoose

// Connect to MongoDB
let connectDb = async () => {
  let conn = await connect("mongodb://localhost:27017/mydb")
  Js.log("Connected to MongoDB")
  conn
}

// Check connection state
let checkConnection = (conn: connection) => {
  if isConnected(conn) {
    Js.log("Database is connected")
  }
}

// Disconnect
let closeDb = async () => {
  await disconnect()
}
```

### Schema Definition

```rescript
open Mongoose
open Mongoose.SchemaTypes

// Define your data type
type user = {
  name: string,
  email: string,
  age: int,
}

// Create schema
let userSchema = schema(
  ~definition={
    "name": string,
    "email": string,
    "age": number,
  },
  ~options={
    timestamps: true,
  }
)

// Add indexes
userSchema->index({"email": 1}, ~options={"unique": true})
```

### Model

```rescript
open Mongoose

// Create/get model (safe for hot-reloading)
let User = getOrCreateModel("User", userSchema)
```

### CRUD Operations

```rescript
open Mongoose

// Create
let createUser = async () => {
  let doc = await User->create({
    "name": "John Doe",
    "email": "john@example.com",
    "age": 30,
  })
  doc
}

// Find by ID
let findById = async (id: string) => {
  let user = await User->findById(id)->exec
  user
}

// Find one
let findByEmail = async (email: string) => {
  let user = await User->findOne(~filter={"email": email})->exec
  user
}

// Find many
let findAll = async () => {
  let users = await User->find()->exec
  users
}
```

### Query Chaining

```rescript
open Mongoose

// Build complex queries with chaining
let getActiveUsers = async () => {
  let users = await User
    ->find(~filter={"status": "active"})
    ->sort({"createdAt": -1})
    ->limit(10)
    ->select("name email")
    ->exec
  users
}

// With population
let getUserWithPosts = async (userId: string) => {
  let user = await User
    ->findById(userId)
    ->populate("posts")
    ->exec
  user
}
```

### Updates

```rescript
open Mongoose

// Find and update
let updateUser = async (id: string, data) => {
  let user = await User
    ->findByIdAndUpdate(id, data)
    ->exec
  user
}

// Update one
let updateEmail = async (id: string, email: string) => {
  let result = await User->updateOne({"_id": id}, {"$set": {"email": email}})
  result
}
```

### Delete

```rescript
open Mongoose

// Find and delete
let deleteUser = async (id: string) => {
  let user = await User->findByIdAndDelete(id)->exec
  user
}

// Delete one
let deleteByEmail = async (email: string) => {
  let result = await User->deleteOne({"email": email})
  result
}
```

### Aggregation

```rescript
open Mongoose

// Aggregation pipeline
let getUserStats = async () => {
  let results = await User
    ->aggregate([
      {"$match": {"status": "active"}},
      {"$group": {
        "_id": "$age",
        "count": {"$sum": 1}
      }},
    ])
    ->execAgg
  results
}
```

### Document Operations

```rescript
open Mongoose

// Save document changes
let saveChanges = async (user: document<user>) => {
  user->set("name", "New Name")
  let updated = await user->save
  updated
}

// Get document ID
let getId = (user: document<user>) => {
  user->id
}
```

### Utilities

```rescript
open Mongoose

// Validate ObjectId
let isValidId = (id: string) => {
  isValidObjectId(id)
}

// Check existence
let userExists = async (email: string) => {
  let result = await User->exists({"email": email})
  result->Belt.Option.isSome
}

// Count documents
let countUsers = async () => {
  let count = await User->countDocuments()
  count
}
```

## License

MIT
