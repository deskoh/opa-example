# Reference

## Example Queries

```sh
# Run REPL
docker run --rm -it -v $PWD/policies:/policies openpolicyagent/opa run -b /policies

# Commands
input := {"method":"POST","user":"alice"}
data.test.admin

# admin is a set containing all of admin names
data.test.admin == {"alice", "david"}
data.test.admin == {"david", "alice"}

# Set comprehension
{ user.name | user := data.users[_]; user.admin == true }
# Object comprehension
{ user.name: user.admin | user := data.users[_] }
# List comprehension
[user | user := data.users[_]]
# Check if all users are admin
all([(user.admin) | user := data.users[_]])
```
