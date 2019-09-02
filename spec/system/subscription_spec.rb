# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Subscription", type: :system do
  scenario "User can subscribe a user" do
    user = create(:user)
    login(user)
    post = create(:post, user_id: user.id)
    logout(user)
    user2 = create(:user)
    login(user2)
    visit "/users/#{user.id}/"
    click_on "購読"
    expect(page).to have_content "購読を解除"
  end
end
