# Reference

https://medium.com/trendyol-tech/first-look-to-opa-open-policy-agent-3542810941c9

## Example Queries

```sh
curl -X POST -d @query-allow.json \
  -H "Content-Type: application/json" \
  http://localhost:8181/v1/data/myapi/policy/allow

curl -X POST -d @query-deny.json \
  -H "Content-Type: application/json" \
  http://localhost:8181/v1/data/myapi/policy/allow

curl -X POST -d @query-whocan.json \
  -H "Content-Type: application/json" \
  http://localhost:8181/v1/data/myapi/policy/whocan
```
