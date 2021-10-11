# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

User.delete_all
House.delete_all

3.times do
  admin_id = Faker::Number.between(from: 1, to: 10)
  house_name = Faker::Space.planet
  House.create(name: house_name, user_id: admin_id)
end

10.times do
  user_name = Faker::Name.name
  user_email = Faker::Internet.email
  user_password = Faker::Internet.password(min_length: 10, max_length: 20)
  house_id = Faker::Number.between(from: 1, to: 3)
  User.create(name: user_name, email: user_email, password: user_password, house_id: house_id)
end
