package summary

report = msg {
  denies := {m | m := data.policies[_].deny[_]}
  msg := sprintf("%d policies failed\n%s", [
    count(denies),
    concat("\n", [sprintf("- %s", [m]) | denies[m]]),
  ])
}