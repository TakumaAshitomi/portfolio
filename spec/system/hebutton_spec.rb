# frozen_string_literal: true

require "rails_helper"
RSpec.feature "hebutton", type: :system do
  before do
    @user = create(:user)
    @user2 = create(:user)
    @post = create(:post, user_id: @user.id)
  end
  scenario "The logged-in user can press a he button." do
    login(@user2)
    visit "/posts/#{@post.id}"
    click_on "へぇ"
    expect(page).to have_content "へぇを取り消し"
    click_on "へぇを取り消し"
    expect(page).to have_content "へぇ"
  end
end
