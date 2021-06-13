# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Faker::Config.locale = :ja

5.times do |n|
  User.create!(
    email: "test#{n}@example.com",
    password: 'password',
    name: Faker::Name.name,
    introduction: Faker::Lorem.paragraph
  )
end

if Rails.env.development?
  28.times do |n|
    user = User.order('RANDOM()').first
    time = Faker::Time.between(from: DateTime.now - 3, to: DateTime.now)
    PostImage.create!(
      user_id: user.id,
      description: Faker::Lorem.paragraph,
      image: File.open("#{Rails.root}/app/assets/images/seed_image/test_image1/test_image (#{n+1}).jpg"),
      created_at: time,
      updated_at: time
    )
  end
end

if Rails.env.production?
  28.times do |n|
    user = User.order('RAND()').first
    time = Faker::Time.between(from: DateTime.now - 3, to: DateTime.now)
    PostImage.create!(
      user_id: user.id,
      description: Faker::Lorem.paragraph,
      image: File.open("#{Rails.root}/app/assets/images/seed_image/test_image1/test_image (#{n+1}).jpg"),
      created_at: time,
      updated_at: time
    )
  end
end

