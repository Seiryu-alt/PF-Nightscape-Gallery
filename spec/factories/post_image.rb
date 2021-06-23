FactoryBot.define do
  factory :post_image do
    association :user
    description { Faker::Lorem.paragraph }
    image { File.open(Rails.root.join('seed_image/seed_image (1).jpg')) }
    location_name { Faker::Address.full_address }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
