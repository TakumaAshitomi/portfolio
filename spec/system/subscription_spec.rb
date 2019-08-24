# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Subscription", type: :system do
  scenario "User can subscribe a user", js: true do
    user = create(:user)
    login(user)
    visit posts_new_path
    fill_in "title", with: "testtitle"
    fill_in_ckeditor "editor", with: "Some text"
    execute_script("window.scrollBy(0,1000)")
    click_on "登録する"
    expect(page).to have_content "作成しました。"
    logout(user)
    user2 = create(:user)
    login(user2)
    visit "/users/#{user.id}/"
    click_on "購読"
    expect(page).to have_content "購読を解除"
    visit "/users/#{user2.id}"
    click_on "Activity"
    expect(page).to have_content("testtitle")
  end
end
