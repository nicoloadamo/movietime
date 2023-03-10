User.all.each do |user|
  REVIEWS_TO_CREATE.times do
    guest = User.where.not(id: user.id).sample
    puts "Picked a guest: #{guest.nickname} different from event creator: #{user.nickname}"
    event = Event.where(user_id: user.id).sample
    puts "Picked event #{event.name} made by #{user.nickname}"
    review = Review.create(
      comment: Faker::Lorem.sentence,
      rating: rand(1..5),
      event_id: event.id,
      reviewer_id: user.id,
      user_id: guest.id
    )

    puts "📝 #{review.reviewer.nickname} gave #{review.rating}⭐️ to #{review.user.nickname} adding: #{review.comment}"

    # EXPLICIT
    # review.reviewer = user    # assign the user_id that perform the review to reviewer_id
    # user = User.where.not(id: user.id).sample    # picking a casual user_id to an user who receives the review
    # review.user = user     # assigning the picked random user to the reviewed user_id
  end
end
