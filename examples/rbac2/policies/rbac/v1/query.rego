package rbac.v1.query

import data.rbac.v1.policies.actions

# Query roles with access rights / actions for specified resource
permission[action] = role {
  # Following will include actions with no roles
  # action := data.actions[_]
  action := actions.allowed[_]
  role := {r | data.permissions[r][input.resource][_] == action}
}
