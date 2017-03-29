@derek = User.create(name: 'Derek')
@sandy = User.create(name: 'Sandy')

lasagna = @derek.provided_meals.create(title: 'Lasagna')

Gift.create(provider: derek, receiver: sandy, meal: lasagna)

