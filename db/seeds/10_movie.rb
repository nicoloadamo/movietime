puts "Creating a bunch of movies"

MOVIES_TO_CREATE.times do
  puts "Creating a movie 👇🏻"
  movie = Movie.create(
    title: Faker::Movie.title,
    overview: Faker::Quote.famous_last_words,
    genre: Faker::Book.genre,
    poster_url: "https://source.unsplash.com/random/400x600",
    length: rand(80...300).to_s,
    rating: rand(0..5)
  )
  puts "🎞️ Created #{movie.title}"
end
