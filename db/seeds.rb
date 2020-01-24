# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

# first creates 50 fake products
50.times do |index|
  product = Product.create!(name: Faker::Food.dish,
                  cost: Faker::Number.decimal(l_digits: 2),
                  country: Faker::Address.country)
  product.save()
  #then creates 5 fake reviews for each of the 50 fake products
  5.times do |j|
    product.reviews.create!(author: Faker::FunnyName.two_word_name,
      content: Faker::Cannabis.health_benefit + "                                                               ",
      rating: Faker::Number.between(from: 1, to: 5))
  end
end

p "Created #{Product.count} products with #{Review.count} reviews"
