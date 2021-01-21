# Reference

https://www.fugue.co/blog/5-tips-for-using-the-rego-language-for-open-policy-agent-opa

## Example Queries

```sh
opa eval -I 'data.summary.report' -d .


opa run --server .

curl -X POST -d '{"input": {"toppings": ["crab", "tomato sauce"], "slices": 6}}' \
  -H "Content-Type: application/json" \
  http://localhost:8181/v1/data/summary

opa eval -I data.summary.report -d policies --format pretty < input.json
```
