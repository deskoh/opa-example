package rbac.v1.policies.roles

# List of Roles allowed to access specified resource
allowed[role_name] {
  some role_name
  data.permissions[role_name][input.resource]
}

in_role {
  input.roles[_] == allowed[_]
}

not_in_role {
  not in_role
}

deny["User does not have required roles"] {
  not_in_role
}
