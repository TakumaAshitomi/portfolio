FactoryBot.define do
  factory :user do
    name {"testuser"}
    sequence(:email) { |n| "example#{n}@mail.com"}
    password {"password"}
    password_confirmation {"password"}
  end
end
