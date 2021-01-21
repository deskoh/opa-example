package rbac.v1

import data.rbac.v1.query
import data.rbac.v1.summary

valid_input_1 = {
  "roles": ["engineering", "webdev"],
  "resource": "server123",
  "action": "read"
}

valid_input_2 = {
  "roles": ["engineering", "hr"],
  "resource": "server123",
  "action": "read"
}

invalid_role = {
  "roles": ["hr"],
  "resource": "server123",
  "action": "read"
}

invalid_rights = {
  "roles": ["hr"],
  "resource": "server123",
  "action": "delete"
}

test_correct_role_allowed_1 {
  allow with input as valid_input_1
}

test_correct_role_allowed_2 {
  allow with input as valid_input_2
}

test_incorrect_role_denied {
  not allow with input as invalid_role
}

test_insufficent_rights_denied {
  not allow with input as invalid_rights
}


resource_1 = { "resource": "server123" }
resource_2 = { "resource": "database456" }

test_permission_1 {
  query.permission == {
    "read": {"webdev", "engineering"},
    "write": {"webdev"}
  } with input as resource_1
}

test_permission_2 {
  query.permission == {
    "read": {"hr"}
  } with input as resource_2
}

# test_report {
#   summary.report = "" with input as valid_input_1
# }
