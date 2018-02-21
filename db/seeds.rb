derek = Member.create(name: 'Derek', email:'derek@google.com', password: 'password')
jack = Member.create(name: 'Jack', email:'jack@google.com', password: 'password')
faye = Member.create(name: 'Faye', email:'faye@google.com', password: 'password')

nly = Group.create(name: 'Neighbors', domain:'google.com')

nly.members << derek
nly.members << jack
nly.members << faye

stew = Meal.create \
  main_title: 'Spanish-Style Potato & Chickpea Stew',
  expected_date: Date.new(2018, 06, 10),
  vendor: "Blue Apron"

cod = Meal.create \
  main_title: 'Seared Cod & Crème Fraîche Sauce',
  expected_date: Date.new(2018, 05, 20),
  vendor: "Blue Apron"


sandwich = Meal.create \
  main_title: 'Spiced Beef Sandwiches & Tzatziki Sauce',
  expected_date: Date.new(2018, 05, 10),
  vendor: "Blue Apron"

catfish = Meal.create \
  main_title: 'Seared Catfish',
  expected_date: Date.new(2018, 06, 01),
  vendor: "Blue Apron"

derek.meals << stew
jack.meals << cod
jack.meals << sandwich
jack.meals << catfish

Gift.create(from: derek, to: faye, meal: stew)
Gift.create(from: jack, to: derek, meal: cod)
