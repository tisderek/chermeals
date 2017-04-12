derek = User.create(name: 'Derek')
sandy = User.create(name: 'Sandy')

lasagna = derek.provided_meals.create(title: 'Lasagna')

transaction = derek.provided_gifts.create(receiver_id: sandy.id, meal_id: lasagna.id)
