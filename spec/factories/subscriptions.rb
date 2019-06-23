FactoryBot.define do
  factory :subscription do
    user_id {1}
    sequence(:followed_id) { |n| "#{n}"}
  end
end
