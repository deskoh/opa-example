package rbac.v1.summary

report = msg {
  denies := {m | m := data.rbac.v1.policies[_].deny[_]}
  msg := sprintf("%d policies failed\n%s", [
    count(denies),
    concat("\n", [sprintf("- %s", [m]) | denies[m]]),
  ])
}
