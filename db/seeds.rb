user1 = User.create!(email: "jantje@gmail.com", password: "12345wdae")
user2 = User.create!(email: "henkie@gmail.com", password: "54321wqd")

Event.create([{name: "Picknick", description: "Having some food on grass", user: user1},
  {name: "Houseparty", description: "Get drunk and dance", user: user1},
  {name: "Babyshower", description: "Celebrate my pregnancy", user: user2},
  {name: "Rave", description: "Take drugs and dance", user: user2}])
