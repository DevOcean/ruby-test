# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Clear existing data
Product.destroy_all
Part.destroy_all
Option.destroy_all
Customization.destroy_all

# Create a product
bike = Product.create!(
  name: "Mountain Bike",
  description: "A rugged mountain bike with customizable parts.",
  price: 1200.00,
  category: "bicycle"
)

# Create parts
frame = Part.create!(name: "Frame", category: "frame")
wheels = Part.create!(name: "Wheels", category: "wheels")
chain = Part.create!(name: "Chain", category: "chain")
rim = Part.create!(name: "Rim", category: "rim color")

# Add options for each part
frame_options = [
  Option.create!(name: "Full-suspension", stock: 5, part: frame),
  Option.create!(name: "Diamond", stock: 3, part: frame),
  Option.create!(name: "Step-through", stock: 7, part: frame)
]

wheels_options = [
  Option.create!(name: "Road wheels", stock: 10, part: wheels),
  Option.create!(name: "Mountain wheels", stock: 6, part: wheels),
  Option.create!(name: "Fat bike wheels", stock: 4, part: wheels)
]

chain_options = [
  Option.create!(name: "Single-speed chain", stock: 15, part: chain),
  Option.create!(name: "8-speed chain", stock: 8, part: chain)
]

rim_options = [
  Option.create!(name: "Red", stock: 5, part: rim),
  Option.create!(name: "Black", stock: 8, part: rim),
  Option.create!(name: "Blue", stock: 7, part: rim)
]

# Associate the parts with the product (customizations)
[frame, wheels, chain, rim].each do |part|
  Customization.create!(product: bike, part: part, option: part.options.first)
end

puts "Seeded the database with sample data!"