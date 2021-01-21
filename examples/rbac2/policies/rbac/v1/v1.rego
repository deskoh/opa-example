# Assuming role is provided in input
package rbac.v1

default allow = false

allow {
  r := input.roles[_]
  input.action == data.permissions[r][input.resource][_]
}
