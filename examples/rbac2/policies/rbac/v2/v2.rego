package rbac.v2

import data.rbac.v2.policies.user

default allow = false

allow {
  # for each role in the set
  r := user.roles[_]

  # get actions allowed for the role on the resrouce
  actions := data.permissions[r][input.resource]
  # check action is allowed
  input.action == actions[_]

  # Equivalently:
  # input.action == data.permissions[r][input.resource][_]
}
