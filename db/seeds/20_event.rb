puts " Creating random Events"

User.all.each do |user|
  EVENTS_TO_CREATE.times do
    puts " Creating Event 👇🏻"

    movie = Movie.all.sample
    puts "🎬 Picking #{movie.title} to associate with the event"

    event = Event.create(
      name: Faker::Movie.quote,
      description: Faker::Lorem.sentence,
      language: "eng",
      address: Faker::Address.full_address,
      start_time: Faker::Time.forward,
      end_time: Faker::Time.forward,
      user_id: user.id,
      movie_id: Movie.all.sample.id,
      max_registrations: rand(1..10)

    )
    puts "🍿 Created #{event.name} by 🥸 #{event.user.nickname}"
  end
end
