# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    association :user
    sequence(:title) { |n| "test#{n}" }
    description { "<div class=\"dsada\">\r\n<p><span style=\"color:#AFEEEE;\">d</span>dasdsadsaad<strong>dsadsad<u>dsadssdds<span style=\"color:#FFD700;\">ddddddddddddddd</span></u></strong></p>\r\n</div>\r\n" }
    user_id { 1 }
  end
end
