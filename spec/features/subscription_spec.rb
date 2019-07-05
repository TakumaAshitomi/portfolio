require "rails_helper"

RSpec.feature "Subscription", type: :feature do
  scenario "User subscribe a user" do
    @user = create(:user)
    @user2 = create(:user)
    @user.confirm
    @user2.confirm
    @post = create(:post)
    login_as(@user2)
    visit "/users/1"
    click_on "購読"
    expect(page).to have_content "購読を解除"
  end
end