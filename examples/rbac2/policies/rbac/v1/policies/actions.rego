package rbac.v1.policies.actions

import data.rbac.v1.policies.roles

# List of actions / access rights allowed to specified resource
allowed[action_name] {
  r := roles.allowed[_]
  action_name := data.permissions[r][input.resource][_]
}

role_has_rights {
  input.roles[i] == roles.allowed[_]
  r := input.roles[i]
  data.permissions[r][input.resource][_] == input.action
}

role_no_rights {
  roles.in_role
  not role_has_rights
}

deny["User role does not have required rights"] {
  role_no_rights
}
