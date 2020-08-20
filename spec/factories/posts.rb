# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    association :user
    sequence(:title) { |n| "test#{n}" }
    description { "<div class=\"dsada\">\r\n<p><span style=\"color:#AFEEEE;\">d</span><img alt=\"\" src=\"/uploads/ckeditor/pictures/1/content_20070821201759_15.jpg\" style=\"width: 115px; height: 136px;\" />dasdsadsaad<strong>dsadsad<u>dsadsadsadsadasdds<span style=\"color:#FFD700;\">ddddddddddddddd</span></u></strong></p>\r\n</div>\r\n" }
    user_id { 1 }
  end
end
