user = User.create email: "neek@movienight.com",
password: "12345678",
password_confirmation: "12345678",
nickname: "Neek",
biography: "Hi there! My name is Neek and I'm a developer who's passionate about cinema and cooking.
When I'm not busy coding, you can usually find me either at the movie theater or in the kitchen experimenting with new recipes.
I believe that both film and food have the power to bring people together and create unforgettable experiences."

# admin: true

puts "Creating an user for each team member"

user = User.create email: "nicolo@movienight.com",
password: "12345678",
password_confirmation: "12345678",
nickname: "Nicolo",
biography: "Hi there! My name is Neek and I'm a developer who's passionate about cinema and cooking.
When I'm not busy coding, you can usually find me either at the movie theater or in the kitchen experimenting with new recipes.
I believe that both film and food have the power to bring people together and create unforgettable experiences."

# admin: false

puts "🔥 Created #{user.nickname} - #{user.password}"

user = User.create email: "wadim@movienight.com",
password: "12345678",
password_confirmation: "12345678",
nickname: "WadimM",
biography: "Hi there, I'm someone who loves to watch movies and meet new friends.
I find joy in exploring different cultures and getting to know people from all walks of life.
I am always on the lookout for new movie recommendations and enjoy discussing my favorite films with others."

puts "🫵🏻 Created #{user.email} - pw: #{user.password}"


user = User.create email: "aleks@movienight.com",
password: "12345678",
password_confirmation: "12345678",
nickname: "AleksV",
biography: "Meet Aleks, a 28-year-old movie enthusiast and coding aficionado hailing from the beautiful city of Zurich.
With a passion for all things tech, I spend my days crafting innovative code and tinkering with new gadgets.
When not immersed in the digital world, I can often be found at the cinema or at home,
catching the latest blockbuster or indie flick."

puts "🤙🏻 Created #{user.email} - pw: #{user.password}"

user = User.create email: "patrick@movienight.com",
password: "12345678",
password_confirmation: "12345678",
nickname: "PatrickC",
biography: "With a keen eye for cinematic storytelling and a love for all things tech,
I'm always on the lookout for the latest and greatest in both the film and coding worlds.
When not glued to a screen, you can find [Your Name] exploring the beautiful Swiss countryside or enjoying a good book."

puts "👨🏻‍💻 Created #{user.email} - pw: #{user.password}"
