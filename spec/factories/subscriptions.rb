# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    association :user
    user_id { 1 }
    sequence(:followed_id, &:to_s)
  end
end
