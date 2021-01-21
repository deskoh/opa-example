package test

allow {
  admin[input.user]
  input.method == "GET"
}

allow {
  admin[input.user]
  input.method == "POST"
}

admin[user.name] {
  user := data.users[_]
  user.admin == true
}

# Alternate syntax (cannot be OR-ed with other rule)
# admin = { user.name |
#   user := data.users[_]
#   user.admin == true
# }