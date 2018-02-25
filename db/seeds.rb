derek = Member.create(name: 'Derek', email:'derek@google.com', password: 'password')
jack = Member.create(name: 'Karen', email:'karen@google.com', password: 'password')
faye = Member.create(name: 'Todd', email:'todd@google.com', password: 'password')
faye = Member.create(name: 'Sprinkles', email:'sprinkles@google.com', password: 'password')

group = Group.create(domain:'google.com')

group.members << derek
group.members << jack
group.members << faye

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
