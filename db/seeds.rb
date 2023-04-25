# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do |n|
  product = Product.create!(
    name: "テスト商品名#{n + 1}",
    description: 'とってもおいしいです',
    price: rand(500..1500)
  )
  # product_a.image.attach(io: File.open(Rails.root.join('app/assets/images/sora.jpg')), filename: 'sora.jpg')
  image_path = Rails.root.join('app/assets/images/sora.jpg')
  product.image.attach(io: File.open(image_path), filename: 'sora.jpg', content_type: 'image/jpg')
end
