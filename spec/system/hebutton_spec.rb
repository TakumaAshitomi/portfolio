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
    expect(page).to have_selector "#deletehe"
    click_on "へぇ"
    expect(page).to have_selector "#addhe"
  end
  scenario "The count change when the button prresed." do
    login(@user2)
    visit "/posts/#{@post.id}"
    click_on "へぇ"
    expect(page).to have_content Hebutton.where(post_id: @post.id).count
    click_on "へぇ"
    expect(page).to have_content Hebutton.where(post_id: @post.id).count
  end
end
