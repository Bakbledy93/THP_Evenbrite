# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


User.destroy_all
Event.destroy_all
Attendance.destroy_all
x = 1

10.times do |x|
  x+=1
  user = User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    description: Faker::Quotes::Shakespeare.hamlet_quote, 
    email: 'kakebebe' + x.to_s + '@yopmail.com', 
    password:"azerty"
    )
end

10.times do |x|
  event = Event.create(
    start_date: Faker::Date.forward(days: 365),
    duration: Faker::Number.between(from: 1, to: 20)*5,
    title: Faker::Movie.title, 
    description: Faker::Quotes::Shakespeare.hamlet_quote, 
    price: Faker::Number.between(from: 1, to: 1000),
    location: Faker::Address.city,
    admin_id: User.find(rand(User.first.id..User.last.id)).id
  )
end

10.times do |x|
  attendance = Attendance.create(
  stripe_customer_id: Faker::Alphanumeric.alpha(number: 10),
  event_id: Event.find(rand(Event.first.id..Event.last.id)).id,
  guest_id: User.find(rand(User.first.id..User.last.id)).id
  )
end


puts 'yala baba'
