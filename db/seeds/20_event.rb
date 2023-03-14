<<<<<<< Updated upstream
require 'httparty'

puts "🇨🇭 Fetching random addresses from Zurich 💙🤍"

def generate_address(addresses)
  # Parse the response to extract the address information
  address = addresses.sample['properties']
  # Combine the address information into a full address string
  full_address = "#{address['adresse']}, #{address['plz'].to_i} #{address['plz_ortschaft']}"

  return full_address
end
response = HTTParty.get('https://www.ogd.stadt-zuerich.ch/wfs/geoportal/Adressen_Stadt_Zuerich?service=WFS&version=1.1.0&request=GetFeature&outputFormat=GeoJSON&typename=adrstzh_adressen_stzh_p')
response_body = response.body
addresses = JSON.parse(response_body)['features']

puts "✅ Fetched all addresses from Zurich"

puts "🎉 Creating random Events"
=======
puts " Creating random Events"
>>>>>>> Stashed changes

User.all.each do |user|
  EVENTS_TO_CREATE.times do
    puts " Creating Event 👇🏻"

    movie = Movie.all.sample
    puts "🎬 Picking #{movie.title} to associate with the event"

    event = Event.create(
<<<<<<< Updated upstream
      name: "Let's watch #{movie.title} together!",
      description: Faker::Lorem.sentence,
      language: ["eng","ita","fr","esp","jap"].sample,
      address: generate_address(addresses),
      start_time: Faker::Time.forward,
      end_time: Faker::Time.forward,
      user_id: user.id,
      movie_id: Movie.all.sample.id,
      max_registrations: rand(1..10)
=======
      name: Faker::Movie.quote,
      description: Faker::Lorem.sentence,
      language: "eng",
      address: Faker::Address.full_address,
      start_time: Faker::Time.forward,
      end_time:Faker::Time.forward,
      user_id: user.id,
      movie_id: Movie.all.sample.id,
      max_registrations: rand(1..10)

>>>>>>> Stashed changes
    )
    puts "🍿 Created #{event.name} by 🥸 #{event.user.nickname}"
  end
end
<<<<<<< Updated upstream
puts "#############################################"
puts "#############################################"
=======
>>>>>>> Stashed changes
