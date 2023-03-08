# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "creating reviewer"
reviewer = User.find_or_create_by(email: "reviewer@movienight.events")
reviewer.update(password: "reviewer")

puts "creating user"
user = User.find_or_create_by(email: "user@movienight.events")
user.update(password: "user123")

puts "creating movie"
movie = Movie.find_or_create_by(title: "Matrix", overview: "auhfiesuhfosijdoufhoadiashfous")

puts "creating event"
event= Event.find_or_create_by(
  user: user,
  name: "brabasdb453",
  description:" sdijfhadisufiasduoijf",
  language:"Eng",
  address: "nowhere in particular, 34",
  start_time: Time.now,
  end_time: Time.now + 2.hours,
  max_registrations: 120,
  movie: movie)

puts "creating rewiew"
puts event.inspect
puts event.errors.inspect

review = Review.find_or_create_by(event: event,
  reviewer: reviewer,
  user: user,
  comment: "jhfaisudsadjhkufhsadhuashfosidfjods",
  rating: 5)
puts review.errors.inspect
