# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "creating reviewer"
reviewer = User.find_or_create_by(email: "reviewer@movienight.events")
reviewer.update(password: "reviewer")

puts "creating user"
user = User.find_or_create_by(email: "user@movienight.events")
user.update(password: "user123")

puts "creating movie"
movie = Movie.find_or_create_by(title: "Matrix", overview: "When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth")

puts "creating event"
event= Event.find_or_create_by(
  user: user,
  name: "Let's watch Matrix",
  description:"Let's watch Matrix with beers and rubies",
  language:"Eng",
  address: "nowhere in particular, 34",
  start_time: Time.now,
  end_time: Time.now + 2.hours,
  max_registrations: 12,
  movie: movie)

puts event.errors.inspect

puts "creating review"
review = Review.find_or_create_by(
  comment: "Best review ever",
  rating: 5,
  user_id: user.id,
  event_id: event.id,
  reviewer_id: reviewer.id)

puts review.errors.inspect

10.times do |page| # Run the command for 2 times
  url = "https://api.themoviedb.org/3/movie/popular?api_key=bdc4ff49a44cc60aa8cbfae1805d5288&language=en-US&page=#{page+1}" # Replace YOUR_API_KEY with your actual API key
  movies_serialized = URI.open(url).read
  movies = JSON.parse(movies_serialized)['results']

  movies.each do |movie|
    # Fetch additional movie details
    details_url = "https://api.themoviedb.org/3/movie/#{movie['id']}?api_key=bdc4ff49a44cc60aa8cbfae1805d5288&language=en-US"
    details_serialized = URI.open(details_url).read
    details = JSON.parse(details_serialized)

    # Create the movie record with all the attributes
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      rating: movie['vote_average'],
      poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
      genre: details['genres'].map { |g| g['name'] }.join(', '),
      length: details['runtime'],
    )
    puts "created movie #{movie['title']}"
  end
end
