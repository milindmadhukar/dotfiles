---
name: go-swagger
description: >
  Sets up and maintains Swagger/OpenAPI documentation for Go HTTP APIs using swaggo.
  Use this skill whenever the user: adds a new route or handler, asks to document their API,
  wants to set up Swagger UI, asks about API docs, asks to annotate handlers, asks to regenerate
  docs, creates or modifies any HTTP handler function, or mentions swaggo, swagger, openapi,
  http-swagger, or "go generate" in a Go project context. Also trigger this skill if the user
  says things like "add an endpoint", "create a route", "new handler" — annotations should be
  applied proactively without waiting for a second ask.
---

# go-swagger skill

You help set up and maintain Swagger/OpenAPI documentation for Go HTTP APIs using the swaggo toolchain.

## When to act

- **Setup**: project has no swagger yet and user wants it added
- **Annotate**: user adds/modifies a handler, or asks to document existing handlers
- **Regenerate**: user changes annotations and wants docs rebuilt

When the user adds a route or handler without mentioning swagger, still add the annotations — it's always the right thing to do and saves them a follow-up ask.

---

## 1. First-time Setup

Do all of these steps in order. Read the relevant files before editing them.

### 1a. Add dependencies

```bash
go get github.com/swaggo/http-swagger/v2
go get github.com/swaggo/swag/cmd/swag@latest
```

### 1b. Create `tools.go`

Place in the project root. The `//go:build tools` tag keeps it out of the normal build but pins the dep in `go.mod`/`go.sum` so `go run` can resolve it without a global install.

```go
//go:build tools

package main

import _ "github.com/swaggo/swag/cmd/swag"
```

### 1c. Add `//go:generate` + global annotations to `main.go`

At the very top of `main.go` (before the `package` declaration), add:

```go
//go:generate go run github.com/swaggo/swag/cmd/swag init --parseDependency --parseInternal -g main.go

// @title           <Project Name> API
// @version         1.0
// @description     <Brief description of what this API does.>
// @host            localhost:<PORT>
// @BasePath        /
```

Fill in the project name, description, and port from context (read the file to find what port is used).

### 1d. Add the Swagger UI route

In the router setup block, add:

```go
r.Get("/swagger/*", httpSwagger.Handler(
    httpSwagger.URL("/swagger/doc.json"),
))
```

And add the import:

```go
httpSwagger "github.com/swaggo/http-swagger/v2"
```

And the blank side-effect import for the generated docs package (add alongside other imports):

```go
_ "<module_name>/docs"
```

The module name comes from the first line of `go.mod`.

### 1e. Run `go generate` to produce the `docs/` package

```bash
go generate .
```

This creates `docs/docs.go`, `docs/swagger.json`, and `docs/swagger.yaml`. The `docs/` directory should be committed — it's needed at runtime.

### 1f. Verify the build

```bash
go build -o /dev/null main.go
```

Fix any import errors before finishing.

---

## 2. Adding Swagger Annotations to Handlers

Every exported HTTP handler function should have a godoc block like this directly above the `func` declaration:

```go
// handlerFuncName godoc
// @Summary      One-line summary (title case, no period)
// @Description  Longer description of what the endpoint does and any important behaviour.
// @Tags         <tag>
// @Accept       json
// @Produce      json
// @Param        <name>  <in>      <type>    <required>  "<description>"
// @Success      <code>  {object}  <type>    "<description>"
// @Failure      <code>  {string}  string    "<error message>"
// @Router       /path/to/route [method]
```

### Param `<in>` values

| Location      | `<in>` value |
|---------------|--------------|
| URL path      | `path`       |
| Query string  | `query`      |
| Request body  | `body`       |
| Header        | `header`     |

### Type references

- For response structs from the `models` package: `models.TypeName`
- For inline maps: `map[string]interface{}`  or `map[string]string`
- For arrays: `[]models.TypeName`
- For primitives: `string`, `integer`, `boolean`

### Omit `@Accept` if the endpoint takes no request body.

### After annotating, always regenerate:

```bash
go generate .
```

---

## 3. Regenerating Docs

Whenever annotations change (new handler, edited description, new param):

```bash
go generate .
```

This is idempotent — safe to run repeatedly. The generated files in `docs/` are overwritten in place.

---

## 4. Common patterns

### Path parameter

```go
// @Param  id  path  integer  true  "Record ID"
```

### Query parameter

```go
// @Param  q  query  string  true  "Search query"
```

### Request body (struct)

```go
// @Accept  json
// @Param   body  body  models.CreateRequest  true  "Request payload"
```

### Multiple success/failure codes

```go
// @Success  200  {object}  models.UserDetail
// @Failure  400  {string}  string  "Bad request"
// @Failure  404  {string}  string  "Not found"
// @Failure  500  {string}  string  "Internal server error"
```

### Accepted status (async operations)

```go
// @Success  202  {object}  map[string]string  "Operation started"
// @Failure  409  {string}  string             "Already in progress"
```

---

## 5. Router-specific notes

### chi (`github.com/go-chi/chi/v5`)

chi uses `{param}` syntax in route patterns, which maps directly to swaggo's `{param}` in `@Router`:

```go
r.Get("/api/users/{username}", handleGetUser)
// @Router /api/users/{username} [get]
```

### Standard `net/http` mux

Use the same `{param}` syntax in the `@Router` annotation even if the mux uses a different pattern internally.

---

## 6. Swagger UI location

Once running, the UI is at:

```
http://<host>:<port>/swagger/index.html
```

The raw OpenAPI JSON spec is at `/swagger/doc.json`.
