# Reference

https://www.openpolicyagent.org/docs/latest/

## Example Queries

```sh
curl -X POST -d @input.json \
  -H "Content-Type: application/json" \
  http://localhost:8181/v1/data/example

# Browse to http://localhost:8181 using input from `input.json`.
# Query:
# data.example.violation[x]
# input.servers[x].id == "app"
```
