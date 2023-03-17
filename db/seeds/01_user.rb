# puts "Delete previous seeds"

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
