puts "Creating a bunch of movies"
MOVIES_PAGES_TO_FETCH.times do |page|
  puts "Fetching movies 👇🏻"
  url = "https://api.themoviedb.org/3/movie/popular?api_key=bdc4ff49a44cc60aa8cbfae1805d5288&language=en-US&page=#{page+1}" # Replace YOUR_API_KEY with your actual API key
  movies_serialized = URI.open(url).read
  movies = JSON.parse(movies_serialized)['results']

  movies.each do |movie|
    # Fetch additional movie details
    details_url = "https://api.themoviedb.org/3/movie/#{movie['id']}?api_key=bdc4ff49a44cc60aa8cbfae1805d5288&language=en-US"
    details_serialized = URI.open(details_url).read
    details = JSON.parse(details_serialized)

    puts "Creating a movie 👇🏻"
    movie = Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      genre: details['genres'].map { |g| g['name'] }.join(', '),
      poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
      length: details['runtime'],
      rating: movie['vote_average']
    )
    puts "🎞️ Created #{movie.title}"
  end
end
puts "🔥🔥🔥 Created #{Movie.all.size} movies 🔥🔥🔥"
puts "#############################################"
puts "#############################################"

