# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Faker::Config.locale = :ja

10.times do |n|
  User.create!(
    email: "test#{n}@example.com",
    password: 'password',
    name: Faker::Internet.username,
    introduction: Faker::Lorem.paragraph
  )
end

if Rails.env.development?
  Dir.glob("#{Rails.root}/seed_image/*.jpg").each do |file_name|
    user = User.order('RANDOM()').first
    time = Faker::Time.between(from: DateTime.now - 3, to: DateTime.now)
    PostImage.create!(
      user_id: user.id,
      description: Faker::Lorem.paragraph,
      image: File.open(file_name),
      created_at: time,
      updated_at: time
    )
  end
end

if Rails.env.production?
  Dir.glob("#{Rails.root}/seed_image/*.jpg").each do |file_name|
    user = User.order('RAND()').first
    time = Faker::Time.between(from: DateTime.now - 3, to: DateTime.now)
    PostImage.create!(
      user_id: user.id,
      description: Faker::Lorem.paragraph,
      image: File.open(file_name),
      created_at: time,
      updated_at: time
    )
  end
end

