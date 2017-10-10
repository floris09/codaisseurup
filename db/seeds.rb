User.destroy_all
Event.destroy_all
Category.destroy_all

user1 = User.create!(email: "jantje@gmail.com", password: "12345wdae")
user2 = User.create!(email: "henkie@gmail.com", password: "54321wqd")

indoor = Category.create(name:"Indoor Event")
outdoor = Category.create(name:"Outdoor Event")
dance = Category.create(name:"Dance Event")
birthday = Category.create(name:"Birthday Event")
bachelor = Category.create(name:"Bachelor Party")

Event.create([{name: "Picknick", description: "Having some food on grass", user: user1, categories: [outdoor]},
  {name: "Houseparty", description: "Get drunk and dance", user: user1, categories: [indoor, dance]},
  {name: "Babyshower", description: "Celebrate my pregnancy", user: user2, categories: [indoor]},
  {name: "Rave", description: "Take drugs and dance", user: user2, categories: [outdoor, dance]}])
