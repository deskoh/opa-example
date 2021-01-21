# OPA Policies Example

## Quick Start

```sh
# Run OPA server without any data or policies.
docker run --rm -p 8181:8181 openpolicyagent/opa run --server

# CD into examples directory
cd examples\XX

# Run OPA server with data and policies
docker run --rm -p 8181:8181 \
  -v $PWD/policies:/policies \
  openpolicyagent/opa run --server /policies

# Run OPA locally
opa run --server policies

# Run OPA REPL with data and policies
docker run --rm -it -v $PWD/policies:/policies openpolicyagent/opa run /policies

# Run query
docker run --rm -v $PWD/policies:/policies openpolicyagent/opa eval -d /policies 'data.acl'

# Test policies (load all files in policies and tests directory)
opa test -v policies tests
```

## REST APIs

```sh
# List policies
curl http://localhost:8181/v1/policies

# Upload data (referenced using `import data.myapi.acl`)
curl -X PUT -H "Content-Type: application/json" \
  --data @policies/acl/myapi-acl.json \
  http://localhost:8181/v1/data/acl

# Upload policy with ID `myapi`
curl -X PUT -H "Content-Type: text/plain" \
   --data-binary @policies/myapi-policy.rego \
  http://localhost:8181/v1/policies/myapi

# Query
curl -X POST -d '{"input": {"user": "alice", "access": "write"}}' \
  -H "Content-Type: application/json" \
  http://localhost:8181/v1/data/myapi/policy/allow
```
