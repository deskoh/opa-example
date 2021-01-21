package rbac.v2.policies.user

# virtual doc (of type set) with specified user roles
roles[role_name] {
  # lookup the list of roles for the user
  data.role_membership[role_name][_] == input.user
}

# function to get user roles
get_roles(user) = roles {
  # Use set comprehension to find user roles
  roles := {role_name| data.role_membership[role_name][_] == user}
}
