# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
 parks = [
     ["Mattapan Park",
     "19 State Road",
     "Mattapan",
     "MA",
     "06661",
     "This place is dangerous"],
     ["Marblehead Park",
       "92 Boston Street",
       "Marblehead",
       "MA",
       "01945",
       "Small and kind of dirty"],
     ["Boston Park",
     "11 Sturrow Drive",
     "Boston",
     "MA",
     "01003",
     "Yankees suck"]
 ]
 parks.each do |park_info|
   name, address, city, state, zip, description = park_info
   Park.create!(name: name, address: address, city: city, state: state, zip: zip, description: description)
 end
