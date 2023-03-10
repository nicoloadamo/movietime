User.all.each do |user|
  REQUESTS_TO_CREATE.times do
    puts "Creating request 👇🏻"
    event = Event.all.sample
    puts "📅 Picked an event from the database"
    request = Request.create(
      status: [:pending, :accepted, :rejected].sample,
      event_id: Event.all.sample.id,
      user_id: event.user_id
    )
    puts "🙏🏻 #{request.user.nickname} created a request for #{request.event.name}, status: #{request.status}"
  end
end
puts "#############################################"
puts "#############################################"
