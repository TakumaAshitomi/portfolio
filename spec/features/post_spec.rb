require "rails_helper"

RSpec.feature "Post", type: :feature do
  scenario "User creates a new post" do
    @user = create(:user)
    @user.confirm
    login_as(@user)
    visit posts_new_path
    fill_in "title", with: "testtitle"
    fill_in "editor", with: "testdescription"
    click_button "登録する"
    expect(page).to have_content "作成しました。"
  end
end