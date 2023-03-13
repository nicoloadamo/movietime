USERS_TO_CREATE = 5
MOVIES_PAGES_TO_FETCH = 5
EVENTS_TO_CREATE = 3
REQUESTS_TO_CREATE = 3
REVIEWS_TO_CREATE = 2

Dir[Rails.root.join("db", "seeds", "*.rb")].sort.each do |file|
  require file
end

# puts "creating reviewer"
# reviewer = User.find_or_create_by(email: "reviewer@movienight.events")
# reviewer.update(password: "reviewer")

# puts "creating user"
# user = User.find_or_create_by(email: "user@movienight.events")
# user.update(password: "user123")

# puts "creating movie"
# movie = Movie.find_or_create_by(title: "Matrix", overview: "When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth")

# puts "creating event"
# event= Event.find_or_create_by(
#   user: user,
#   name: "Let's watch Matrix",
#   description:"Let's watch Matrix with beers and rubies",
#   language:"Eng",
#   address: "nowhere in particular, 34",
#   start_time: Time.now,
#   end_time: Time.now + 2.hours,
#   max_registrations: 120,
#   movie: movie)

# puts "creating rewiew"
# puts event.inspect
# puts event.errors.inspect

# review = Review.find_or_create_by(event: event,
#   reviewer: reviewer,
#   user: user,
#   comment: "Best review ever",
#   rating: 5)
# puts review.errors.inspect
