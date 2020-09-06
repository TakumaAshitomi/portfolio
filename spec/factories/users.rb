# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { "testuser" }
    sequence(:email) { |n| "example#{n}@mail.com" }
    password { "passWo!rd21" }
    password_confirmation { "passWo!rd21"}
    role { "member" }
  end
  factory :adminuser, class: User do
    name { "adminuser" }
    sequence(:email) { |n| "admin#{n}@mail.com" }
    password { "passWo!rd21" }
    password_confirmation { "passWo!rd21" }
    role { "admin" }
  end
end
