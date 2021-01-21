# Reference

https://www.openpolicyagent.org/docs/latest/deployments/

## Example Queries

```sh
# Upload data named `input`
curl -X POST -H "Content-Type: application/json" \
  --data @input.json \
  http://localhost:8181/v1/data/input
```
