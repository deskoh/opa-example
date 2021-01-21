# Reference

## Example Queries

```sh
# Role included in input
curl -X POST -H "Content-Type: application/json" \
  --data @input-v1.json \
  http://localhost:8181/v1/data/rbac/v1

# Role membership provided in data
curl -X POST -H "Content-Type: application/json" \
  --data @input-v2.json \
  http://localhost:8181/v1/data/rbac/v2

# Query who has permissions to specified resource
curl -X POST -H "Content-Type: application/json" \
  --data @query-permissions.json \
  http://localhost:8181/v1/data/rbac/v1/query

# REPL Query
input := {"resource": "server123"}
data.rbac.v2.query
{action: user |
  action := data.actions[_]
  action == data.permissions[role][input.resource][_]
  user := data.role_membership[role][_]
}
```
