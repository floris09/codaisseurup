Photo.destroy_all
Category.destroy_all
Event.destroy_all
Profile.destroy_all
User.destroy_all


user1 = User.create!(email: "jantje@gmail.com", password: "12345wdae")
user2 = User.create!(email: "henkie@gmail.com", password: "54321wqd")

indoor = Category.create(name:"Indoor Event")
outdoor = Category.create(name:"Outdoor Event")
dance = Category.create(name:"Dance Event")
birthday = Category.create(name:"Birthday Event")
bachelor = Category.create(name:"Bachelor Party")

event1 = Event.create!(name: "Picknick", description: "Having some food on grass", user: user1, categories: [outdoor])
event2 = Event.create!(name: "Houseparty", description: "Get drunk and dance", user: user1, categories: [indoor, dance])
event3 = Event.create!(name: "Babyshower", description: "Celebrate my pregnancy", user: user2, categories: [indoor])
event4 = Event.create!(name: "Rave", description: "Take drugs and dance", user: user2, categories: [outdoor, dance])

photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/florismeininger/image/upload/c_scale,w_581/v1504898103/roadway-1149579_1280_n1ru3b.jpg", event: event1)
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/florismeininger/image/upload/c_scale,w_592/v1504898102/MaxPixel.freegreatpicture.com-Sea-Clear-Sky-Sky-Ocean-Sky-Background-Sand-Beach-1077084_dxyaaa.jpg", event: event1)

photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/florismeininger/image/upload/c_scale,w_756/v1504898103/pexels-photo-39811_dgz876.jpg", event: event2)
photo4 = Photo.create!(remote_image_url: "http://res.cloudinary.com/florismeininger/image/upload/c_scale,w_654/v1504625742/water-1330252_1280_fuikwf.jpg", event: event2)

photo5 = Photo.create!(remote_image_url: "http://res.cloudinary.com/florismeininger/image/upload/c_scale,w_492/v1502627203/sample.jpg", event: event3)
photo6 = Photo.create!(remote_image_url: "http://res.cloudinary.com/florismeininger/image/upload/c_scale,w_576/v1504639689/Albert_Einstein_Head_u0rpbl.jpg", event: event3)

photo7 = Photo.create!(remote_image_url: "http://res.cloudinary.com/florismeininger/image/upload/c_scale,w_625/v1504639848/Gandhi_smiling_R_fvxjiq.jpg", event: event4)
photo8 = Photo.create!(remote_image_url: "http://res.cloudinary.com/florismeininger/image/upload/v1504640005/martin_luther_king_jr_wuphxp.jpg", event: event4)
