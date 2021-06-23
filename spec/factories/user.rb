FactoryBot.define do
  factory :user do
    name { Faker::Internet.username }
    introduction { Faker::Lorem.paragraph }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
