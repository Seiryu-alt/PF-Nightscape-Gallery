FactoryBot.define do
  factory :user do
    name { Faker::Internet.username }
    introduction { Faker::Lorem.paragraph }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
