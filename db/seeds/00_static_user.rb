
user = User.create email: "neek@movienight.com",
password: "12345678",
password_confirmation: "12345678",
nickname: "Neek",
biography: Faker::Lorem.sentence
# admin: true

puts "Creating an user for each team member"

user = User.create email: "nicolo@movienight.com",
password: "12345678",
password_confirmation: "12345678",
nickname: "Nicolo",
biography: Faker::Lorem.sentence
# admin: false

puts "🔥 Created #{user.nickname} - #{user.password}"
