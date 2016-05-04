# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  description = Faker::Lorem.sentence(3)
  location = Faker::Address.street_address
  date = Faker::Date.between(7.days.ago, 1.year.from_now)
  users.each { |user| user.events.create!(description: description, location: location, date: date) }
end

invitees = User.all
events = Event.all
 invitees.each { |i| Invitation.create!(invitee: i, event: events.sample) }
