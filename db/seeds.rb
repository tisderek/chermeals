derek = Member.create(name: 'Derek', email:'test@test.com', password: 'password')
jack = Member.create(name: 'Jack', email:'test2@test.com', password: 'password')
nly = Group.create(name: 'Neighbors', slug:'neighbors')
nly.members << derek
nly.members << jack
sandy = Member.create(name: 'Faye', email:'sandy@neighborly.com', password: 'password')

stew = Meal.create(
  main_title: 'Spanish-Style Potato & Chickpea Stew',
  expected_date: Date.new(2018, 06, 10),
  vendor: "Blue Apron"
)

derek.meals << stew

cod = jack.provided_meals.create(
  main_title: 'Seared Cod & Crème Fraîche Sauce',
  expected_date: Date.new(2018, 05, 20),
  vendor: "Blue Apron"
)

sandwich = jack.provided_meals.create(
  main_title: 'Spiced Beef Sandwiches & Tzatziki Sauce',
  expected_date: Date.new(2018, 05, 10),
  vendor: "Blue Apron"
)

catfish = derek.provided_meals.create(
  main_title: 'Seared Catfish',
  expected_date: Date.new(2018, 06, 01),
  vendor: "Blue Apron"
)

derek.provided_gifts.create(receiver_id: sandy.id, meal_id: stew.id),
derek.received_gifts.create(vendor_id: jack.id, meal_id: sandwich.id)

