# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  {
    fullname: "William",
    email: "william@email.com",
    password: "test_1"
  },
  {
    fullname: "Jhon",
    email: "jhon@email.com",
    password: "test_2"
  },
  {
    fullname: "Joe",
    email: "joe@email.com",
    password: "test_3"
  },
  {
    fullname: "Chitose",
    email: "chitose@email.com",
    password: "test_4"
  }
]

users.each do |user|
  User.create(
    fullname: user[:fullname], 
    email: user[:email], 
    password: user[:password], 
    password_confirmation: user[:password]
  )
end