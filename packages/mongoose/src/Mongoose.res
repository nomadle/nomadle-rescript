/**
 * Comprehensive Mongoose bindings for ReScript
 * Covers: Connection, Schema, Model, Query, Document, Aggregation
 */

// ============================================================================
// CORE TYPES (defined first to avoid forward reference issues)
// ============================================================================

type connection
type schema<'t>
type model<'t>
type document<'t>
type query<'result>
type aggregation<'result>

// ============================================================================
// CONNECTION
// ============================================================================

@module("mongoose") @val
external connection: connection = "connection"

@module("mongoose")
external connect: (string, ~options: 'a=?) => promise<connection> = "connect"

@module("mongoose")
external disconnect: unit => promise<unit> = "disconnect"

// ============================================================================
// SCHEMA
// ============================================================================

type schemaOptions = {
  timestamps?: bool,
  collection?: string,
  strict?: bool,
}

@module("mongoose")
external schema: (~definition: 'def=?, ~options: schemaOptions=?) => schema<'a> = "Schema"

// Schema methods
@send external index: (schema<'a>, 'index, ~options: 'opts=?) => unit = "index"
@send external pre: (schema<'a>, string, 'middleware) => unit = "pre"
@send external post: (schema<'a>, string, 'middleware) => unit = "post"
@send external virtual: (schema<'a>, string, 'options) => unit = "virtual"
// Unused but kept for API completeness
@@warning("-32")
@send external setSchemaField: (schema<'a>, string, 'value) => unit = "set"
@send external get: (schema<'a>, string) => 'value = "get"
@send external plugin: (schema<'a>, 'plugin, ~options: 'opts=?) => unit = "plugin"

// Static methods
@send
external static: (schema<'a>, string, 'fn) => unit = "static"

// Instance methods
@send
external method: (schema<'a>, string, 'fn) => unit = "method"

// ============================================================================
// QUERY
// ============================================================================

@send external exec: query<'a> => promise<'a> = "exec"
@send external then: (query<'a>, 'a => 'b) => promise<'b> = "then"
@send external catch: (query<'a>, exn => 'b) => promise<'b> = "catch"

// Query chaining
@send external where: (query<'a>, string) => query<'a> = "where"
@send external equals: (query<'a>, 'value) => query<'a> = "equals"
@send external select: (query<'a>, string) => query<'a> = "select"
@send external limit: (query<'a>, int) => query<'a> = "limit"
@send external skip: (query<'a>, int) => query<'a> = "skip"
@send external sort: (query<'a>, 'sort) => query<'a> = "sort"
@send external populate: (query<'a>, string, ~options: 'opts=?) => query<'a> = "populate"
// lean() - returns plain JS objects instead of Mongoose documents
@send external lean: query<'a> => query<'a> = "lean"
@send external orFail: (query<'a>, ~message: string=?) => query<'a> = "orFail"

// ============================================================================
// MODEL
// ============================================================================

@module("mongoose")
external model: (string, schema<'a>) => model<'a> = "model"

// Safe model getter - Mongoose returns existing model if already compiled
// Use try/catch to safely attempt to retrieve existing model before creating
let getOrCreateModel = (name: string, schema: schema<'a>): model<'a> => {
  let existingModel = %raw(`
    (function() {
      try {
        // Try to get existing model (returns model if exists, throws if not)
        return Mongoose.model(name);
      } catch (e) {
        // Model doesn't exist yet, return undefined
        return undefined;
      }
    })()
  `)
  switch Nullable.toOption(existingModel) {
  | Some(m) => m
  | None => model(name, schema)
  }
}

// Model static methods
@send
external create: (model<'a>, 'data) => promise<document<'a>> = "create"

@send
external insertMany: (model<'a>, array<'data>) => promise<array<document<'a>>> = "insertMany"

@send
external findById: (model<'a>, string) => query<option<document<'a>>> = "findById"

@send
external findOne: (model<'a>, ~filter: 'filter=?) => query<option<document<'a>>> = "findOne"

@send
external find: (model<'a>, ~filter: 'filter=?) => query<array<document<'a>>> = "find"

@send
external findByIdAndUpdate: (model<'a>, string, 'update) => query<option<document<'a>>> = "findByIdAndUpdate"

@send
external findByIdAndDelete: (model<'a>, string) => query<option<document<'a>>> = "findByIdAndDelete"

@send
external findOneAndUpdate: (model<'a>, 'filter, 'update) => query<option<document<'a>>> = "findOneAndUpdate"

@send
external findOneAndDelete: (model<'a>, 'filter) => query<option<document<'a>>> = "findOneAndDelete"

@send
external updateOne: (model<'a>, 'filter, 'update) => promise<'result> = "updateOne"

@send
external updateMany: (model<'a>, 'filter, 'update) => promise<'result> = "updateMany"

@send
external deleteOne: (model<'a>, 'filter) => promise<'result> = "deleteOne"

@send
external deleteMany: (model<'a>, 'filter) => promise<'result> = "deleteMany"

@send
external countDocuments: (model<'a>, ~filter: 'filter=?) => promise<int> = "countDocuments"

@send
external estimatedDocumentCount: model<'a> => promise<int> = "estimatedDocumentCount"

@send
external exists: (model<'a>, 'filter) => promise<option<{"_id": string}>> = "exists"

@send
external distinct: (model<'a>, string, ~filter: 'filter=?) => promise<array<'value>> = "distinct"

@send
external aggregate: (model<'a>, array<'pipeline>) => aggregation<array<'result>> = "aggregate"

// ============================================================================
// DOCUMENT
// ============================================================================

@get external id: document<'a> => string = "_id"
@get external docId: document<'a> => string = "id"

@send external save: document<'a> => promise<document<'a>> = "save"
@send external remove: document<'a> => promise<unit> = "remove"
@send external deleteOneDoc: document<'a> => promise<unit> = "deleteOne"
@send external toObject: (document<'a>, ~options: 'opts=?) => dict<JSON.t> = "toObject"
@send external toJSON: document<'a> => JSON.t = "toJSON"
@send external markModified: (document<'a>, string) => unit = "markModified"
@send external isModified: (document<'a>, string) => bool = "isModified"
@send external isNew: document<'a> => bool = "isNew"
@send external get: (document<'a>, string) => 'value = "get"
@send external set: (document<'a>, string, 'value) => unit = "set"
@send external populateDoc: (document<'a>, string) => promise<document<'a>> = "populate"

// ============================================================================
// AGGREGATION
// ============================================================================

@send external execAgg: aggregation<'a> => promise<'a> = "exec"

// Aggregation pipeline stages
@send
external match: (aggregation<'a>, 'filter) => aggregation<'a> = "match"

@send
external group: (aggregation<'a>, 'group) => aggregation<'a> = "group"

@send
external sortAgg: (aggregation<'a>, 'sort) => aggregation<'a> = "sort"

@send
external project: (aggregation<'a>, 'projection) => aggregation<'a> = "project"

@send
external limitAgg: (aggregation<'a>, int) => aggregation<'a> = "limit"

@send
external skipAgg: (aggregation<'a>, int) => aggregation<'a> = "skip"

@send
external unwind: (aggregation<'a>, string) => aggregation<'a> = "unwind"

@send
external lookup: (aggregation<'a>, 'lookup) => aggregation<'a> = "lookup"

// ============================================================================
// SCHEMA TYPES
// ============================================================================

module SchemaTypes = {
  @module("mongoose") @scope(("Schema", "Types")) @val
  external objectId: 'a = "ObjectId"

  @module("mongoose") @scope(("Schema", "Types")) @val
  external string: 'a = "String"

  @module("mongoose") @scope(("Schema", "Types")) @val
  external number: 'a = "Number"

  @module("mongoose") @scope(("Schema", "Types")) @val
  external boolean: 'a = "Boolean"

  @module("mongoose") @scope(("Schema", "Types")) @val
  external date: 'a = "Date"

  // Array type helpers - these output [Type] for Mongoose arrays
  // Mongoose is imported at the top of the generated JS file
  let stringArray: array<JSON.t> = %raw(`[Mongoose.Schema.Types.String]`)
  let numberArray: array<JSON.t> = %raw(`[Mongoose.Schema.Types.Number]`)
  let mixedArray: array<JSON.t> = %raw(`[Mongoose.Schema.Types.Mixed]`)

  @module("mongoose") @scope(("Schema", "Types")) @val
  external mixed: 'a = "Mixed"

  @module("mongoose") @scope(("Schema", "Types")) @val
  external map: 'a => 'b = "Map"
}

// ============================================================================
// CONNECTION STATE
// ============================================================================

// Connection readyState values:
// 0 = disconnected
// 1 = connected
// 2 = connecting
// 3 = disconnecting
let disconnected = 0
let connected = 1
let connecting = 2
let disconnecting = 3

@get external readyState: connection => int = "readyState"

let isConnected = (conn: connection): bool => {
  conn->readyState == connected
}

let isDisconnected = (conn: connection): bool => {
  conn->readyState == disconnected
}

// ============================================================================
// ERROR HANDLING
// ============================================================================

type mongooseError = {
  message: string,
  name: string,
  code?: int,
}

// ============================================================================
// UTILS
// ============================================================================

@module("mongoose")
external isValidObjectId: 'value => bool = "isValidObjectId"

@module("mongoose")
external isObjectIdOrHexString: string => bool = "isObjectIdOrHexString"

@module("mongoose") @scope("Types") @val
external objectIdFromString: string => 'objectId = "ObjectId"

// ============================================================================
// DATABASE INITIALIZATION HELPERS
// ============================================================================

// Helper to check if data exists in a collection
@send
external estimatedDocumentCount: model<'a> => promise<int> = "estimatedDocumentCount"
