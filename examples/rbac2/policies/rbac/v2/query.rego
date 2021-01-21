package rbac.v2.query

import data.rbac.v1.policies.actions

# Query users with access rights / actions for specified resource
permission[action] = user {
  # Following will include actions with no roles
  # action := data.actions[_]

  # For each actions allowed for the resource
  action := actions.allowed[_]

  # Nested 'loop' with cause error 'object keys must be unique'
  # data.permissions[r][input.resource][_] == action

  # Find all users with role membership
  user := {u |
    # For each of the roles, r, required for the action on the resource
    data.permissions[r][input.resource][_] == action
    u := data.role_membership[r][_]
  }
}
