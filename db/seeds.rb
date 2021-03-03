# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Restaurant.destroy_all
cats = ["chinese", "italian", "japanese", "french", "belgian"]

50.times do |i|
  restaurant = Restaurant.create(
    name: Faker::Beer.hop,
    address: Faker::TvShows::BigBangTheory.character + " " + (i * 2).to_s,
    phone_number: Faker::PhoneNumber.phone_number,
    category: cats.sample()
  )
  puts restaurant.errors.full_messages

  puts "created with id #{restaurant.id}"

  5.times do
    Review.create(
      rating: rand(0..5),
      content: Faker::Quotes::Shakespeare.hamlet_quote,
      restaurant_id: restaurant.id
    )
  end
end

puts "done"
