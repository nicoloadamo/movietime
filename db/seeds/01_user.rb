# puts "Delete previous seeds"

user = User.create email: "wadim@movienight.com",
password: "12345678",
password_confirmation: "12345678",
nickname: "WadimM",
biography: Faker::Lorem.sentence

puts "🫵🏻 Created #{user.email} - pw: #{user.password}"


user = User.create email: "aleks@movienight.com",
password: "12345678",
password_confirmation: "12345678",
nickname: "AleksV",
biography: Faker::Lorem.sentence

puts "🤙🏻 Created #{user.email} - pw: #{user.password}"

user = User.create email: "patrick@movienight.com",
password: "12345678",
password_confirmation: "12345678",
nickname: "PatrickC",
biography: Faker::Lorem.sentence

puts "👨🏻‍💻 Created #{user.email} - pw: #{user.password}"


USERS_TO_CREATE.times do
  user = User.create email: Faker::Internet.safe_email,
    password: "12345678",
    password_confirmation: "12345678",
    nickname: Faker::FunnyName.name,
    biography: Faker::Lorem.sentence

  puts "👽 Created #{user.nickname} - pw: #{user.password}"
end
puts "#############################################"
puts "#############################################"
