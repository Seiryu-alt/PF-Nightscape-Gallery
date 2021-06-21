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
  User.all.each do |user|
    follow_users = User.order('RANDOM()').limit(rand(1..10))
    follow_users.each do |follow_user|
      user.follow(follow_user)
    end
  end

  Dir.glob("#{Rails.root}/seed_image/*.jpg").each do |file_name|
    user = User.order('RANDOM()').first
    time = Faker::Time.between(from: DateTime.now - 3, to: DateTime.now)
    post_image = PostImage.create!(
      user_id: user.id,
      description: Faker::Lorem.paragraph,
      image: File.open(file_name),
      created_at: time,
      updated_at: time
    )

    users = User.order('RANDOM()').limit(rand(1..10))
    users.each do |user|
      user.like(post_image)
    end
    users = User.order('RANDOM()').limit(rand(1..10))
    PostImageComment.create!(
      user_id: user.id,
      post_image_id: post_image.id,
      comment: Faker::Lorem.paragraph
    )
  end
end

if Rails.env.production?
  User.all.each do |user|
    follow_users = User.order('RAND()').limit(rand(1..10))
    follow_users.each do |follow_user|
      user.follow(follow_user)
    end
  end

  Dir.glob("#{Rails.root}/seed_image/*.jpg").each do |file_name|
    user = User.order('RAND()').first
    time = Faker::Time.between(from: DateTime.now - 3, to: DateTime.now)
    post_image = PostImage.create!(
      user_id: user.id,
      description: Faker::Lorem.paragraph,
      image: File.open(file_name),
      created_at: time,
      updated_at: time
    )

    users = User.order('RAND()').limit(rand(1..10))
    urs.each do |user|
      user.like(post_image)
    end
    users = User.order('RAND()').limit(rand(1..10))
    PostImageComment.create!(
      user_id: user.id,
      post_image_id: post_image.id,
      comment: Faker::Lorem.paragraph
    )
  end
end

