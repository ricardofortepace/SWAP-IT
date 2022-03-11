require 'faker'

puts 'start'
5.times do
  user = User.first
  name = Faker::Vehicle.manufacture
  description = Faker::Vehicle.car_options

  stuff = Stuff.create!(name: name, description: description, user_id: user.id)
end
puts 'end'
