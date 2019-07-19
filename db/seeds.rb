# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# if Rails.env.development?
#  parks = [
#      ["Mattapan Park",
#        "19 State Road",
#        "Mattapan",
#        "MA",
#        "06661",
#        "This place is dangerous"],
#      ["Marblehead Park",
#        "92 Boston Street",
#        "Marblehead",
#        "MA",
#        "01945",
#        "Small and kind of dirty"],
#      ["Boston Park",
#        "11 Sturrow Drive",
#        "Boston",
#        "MA",
#        "01003",
#        "Yankees suck"]
#  ]
#  parks.each do |park_info|
#    name, address, city, state, zip, description = park_info
#    park = Park.create!(name: name, address: address, city: city, state: state, zip: zip, description: description)
#  end
# end

park1 = Park.create(name: "Mattapan Park", address: "19 State Road", city: "Mattapan", state: "MA", zip: 06661, description: "This place sucks")
park2 = Park.create(name: "DexterPark", address: "19 City Road", city: "Boston", state: "MA", zip: 06661, description: "This place is great")
park3 = Park.create(name: "Chinatown", address: "29 Town Road", city: "Boston", state: "MA", zip: 06661, description: "This place is really awesome")

user1 = User.create(email: "ChrisLay@nothere.com", password: "Chrisyouslacker")
user2 = User.create(email: "Rita@ishere.com", password: "Ritanotaslacker")
user3 = User.create(email: "Kevin@ishere.com", password: "Kevinnotaslacker")

review1 = Review.create(park: park1, rating: 4, body: "I would not recommend", user_id: 1)
review2 = Review.create(park: park2, rating: 3, body: "awesome", user_id: 2)
review3 = Review.create(park: park3, rating: 5, body: "The best place evaaarrrrrrrr", user_id: 3)
