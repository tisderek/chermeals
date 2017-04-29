derek = User.create(name: 'Derek', email:'derek@neighborly.com', password: 'password')
jack = User.create(name: 'Jack', email:'jack@neighborly.com', password: 'password')
sandy = User.create(name: 'Sandy', email:'sandy@neighborly.com', password: 'password')

stew = derek.provided_meals.create(
  main_title: 'Spanish-Style Potato & Chickpea Stew',
  sub_title: 'with Swiss Chard & Aioli',
  description: "Smoked paprika is an essential ingredient in Spanish cuisine: its distinctive flavor and beautiful color bring plenty of vibrant character to numerous dishes. Here, we’re using it in a blend with cumin and turmeric (in a nod to the region's North African influences) to give our hearty chickpea and potato stew warming depth. For a sweet lift, we're also adding in the juice of a pixie mandarin—a late-season citrus variety. Chefs, be sure to stir your garlicky aioli into each bowl of stew for a touch of welcome creaminess.",
  cook_time: "20-30mins",
  calories_count: 660,
  expected_date: Date.new(2018, 06, 10),
  hero_image: 'stew'
)

cod = jack.provided_meals.create(
  main_title: 'Seared Cod & Crème Fraîche Sauce',
  sub_title: 'with Warm Potato, Cabbage, & Olive Salad',
  description: "Tonight, a unique potato salad makes a gourmet side for pan-seared cod. Instead of boiling, we're pan-frying our potatoe for crispy texture, then adding green cabbage and sautéing until wilted. Buttery Castelvetrano olives round out the hearty salad with a touch of briny flavor. For a bright, creamy counterpoint (ideal for drizzling on the cod and vegetables), we're making a sauce with crême fraîche and the juice of a pink lemon, known for its rosy color and slightly fruity tang.",
  cook_time: '15-25mins',
  calories_count: 650,
  expected_date: Date.new(2018, 05, 20),
  hero_image: 'cod'
)

sandwich = jack.provided_meals.create(
  main_title: 'Spiced Beef Sandwiches & Tzatziki Sauce',
  sub_title: 'with Arugula & Date Salad',
  description: 'This recipe is inspired by the flavors of a Greek gyro—a hearty sandwich of rotisserie-cooked meat served in a flatbread. Ours showcases tender beef sautéed with a blend of za’atar and Aleppo pepper, then layered onto soft pitas along with garlic-seasoned labneh (a rich, creamy cheese made from thick yogurt). A unique salad of arugula and dates balances out the rich sandwiches.',
  cook_time: '15-25mins',
  calories_count: 650,
  expected_date: Date.new(2018, 05, 10),
  hero_image: 'sandwich'
)

catfish = derek.provided_meals.create(
  main_title: 'Seared Catfish',
  sub_title: 'with Udon Noodles, Mushrooms & Carrots',
  description: "Tender and delightfully chewy, udon noodles are at the heart of tonight's flavorful, Japanese-inspired dish. We're tossing them with sautéed mushrooms, celery and carrots, for a hearty accompaniment to pan-seared catfish. A sprinkling of smoked and crumbled dulse—a type of red seaweed with a deliciously savory flavor—makes for a gourmet garnish.',
  cook_time: '15-25mins",
  calories_count: 650,
  expected_date: Date.new(2018, 06, 01),
  hero_image: 'catfish'

)

derek.provided_gifts.create(receiver_id: sandy.id, meal_id: stew.id)
derek.received_gifts.create(provider_id: jack.id, meal_id: sandwich.id)

