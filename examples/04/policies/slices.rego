package policies.slices

deny["must be able to share with two people"] {
  input.slices % 2 != 0
}

deny["must be able to share with two people"] {
    not input.slices
}
