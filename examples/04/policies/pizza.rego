package pizza

default allow = false

allow {
  not cannot_cut_pizza
}

cannot_cut_pizza {
  input.people[_].profession != "mathematician"
}

allow_v2 {
  all([(person.profession == "mathematician") | person := input.people[_]])
}

has_a_pizza_shape {
  input.shape == "circle"
} {
  input.shape == "circular_sector"
}

probably_a_pizza {
  has_a_pizza_shape
  input.ingredients[_] == "cheese"
  input.ingredients[_] == "tomato_sauce"
}

probably_a_pizza_v2 {
  any([input.shape == "circle", input.shape == "circular_sector"])
  input.ingredients[_] == "cheese"
  input.ingredients[_] == "tomato_sauce"
}