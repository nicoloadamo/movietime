
user = User.create email: "neek@movienight.com",
password: "12345678",
password_confirmation: "12345678",
nickname: "Neek",
biography: "Hi there! My name is Neek and I'm a developer who's passionate about cinema and cooking up delicious meals.
When I'm not busy coding, you can usually find me either at the movie theater or in the kitchen experimenting with new recipes.
I believe that both film and food have the power to bring people together and create unforgettable experiences.
Whether I'm working on a software project or whipping up a gourmet meal, I always strive to bring creativity and innovation to everything I do.
Thanks for stopping by and I hope you enjoy following along on my journey!"

# admin: true

puts "Creating an user for each team member"

user = User.create email: "nicolo@movienight.com",
password: "12345678",
password_confirmation: "12345678",
nickname: "Nicolo",
biography: "Hi there! My name is Neek and I'm a developer who's passionate about cinema and cooking up delicious meals.
When I'm not busy coding, you can usually find me either at the movie theater or in the kitchen experimenting with new recipes.
I believe that both film and food have the power to bring people together and create unforgettable experiences.
Whether I'm working on a software project or whipping up a gourmet meal, I always strive to bring creativity and innovation to everything I do.
Thanks for stopping by and I hope you enjoy following along on my journey!"

# admin: false

puts "🔥 Created #{user.nickname} - #{user.password}"
