package rbac.v2

import data.rbac.v2.query

valid_input_1 = {
  "user": "alice",
  "resource": "server123",
  "action": "read"
}

valid_input_2 = {
  "user": "charlie",
  "resource": "server123",
  "action": "read"
}

invalid_role = {
  "user": "bob",
  "resource": "server123",
  "action": "write"
}

invalid_rights = {
  "user": "charlie",
  "resource": "server123",
  "action": "write"
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
    "read": {"alice", "charlie"},
    "write": {"alice"}
  } with input as resource_1
}

test_permission_2 {
  query.permission == {
    "read": {"bob"}
  } with input as resource_2
}
