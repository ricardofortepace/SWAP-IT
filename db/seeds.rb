require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
  user = User.first
  name = Faker::Name.name
  description = Faker::ChuckNorris.fact

  stuff = Stuff.create(name: name, description: description, user_id: user.id)
  stuff.save!

    pp stuff
end
