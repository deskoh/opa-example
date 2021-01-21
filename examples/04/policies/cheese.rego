package policies.cheese

contains_cheese {
  input.toppings[_] == "cheese"
}

deny["must contain cheese"] {
  not contains_cheese
}