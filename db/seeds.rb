# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

BillRecord.delete_all
TaskRecord.delete_all
User.delete_all
House.delete_all
Appliance.delete_all

# create the first house for default
admin_id = Faker::Number.between(from: 1, to: 10)
house_name = Faker::Space.planet
House.create(name: house_name, user_id: admin_id)

10.times do
  user_name = Faker::Name.name
  user_email = Faker::Internet.email
  user_password = Faker::Internet.password(min_length: 10, max_length: 20)
  house_id = Faker::Number.between(from: 1, to: 3)
  User.create(name: user_name, email: user_email, password: user_password, house_id: house_id)
end

20.times do
  task_name = Faker::Lorem.sentence
  task_description = Faker::Lorem.paragraph
  priority = Faker::Number.between(from: 1, to: 2)
  house_id = 1
  due_date = Faker::Date.forward(days: 14)
  Task.create(name: task_name, description: task_description, priority: priority, house_id: house_id,
              due_date: due_date)
end

Appliance.create(name: 'Washing Machine', house_id: 1, user_id: -1, used: false)
Appliance.create(name: 'Dryer', house_id: 1, user_id: -1, used: false)
Appliance.create(name: 'Dishwasher', house_id: 1, user_id: -1, used: false)

TaskRecord.create(task_id: 1, user_id: 1)
TaskRecord.create(task_id: 2, user_id: 1)
TaskRecord.create(task_id: 1, user_id: 2)
TaskRecord.create(task_id: 1, user_id: 3)
