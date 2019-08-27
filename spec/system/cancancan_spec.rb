# frozen_string_literal: true

# require "rails_helper"

RSpec.feature "Cancancan", type: :system do
  scenario "Admin user can see manage page" do
    user = create(:adminuser)
    login(user)
    visit "/managepage"
    expect(page).to_not have_content "管理ユーザー専用ページです"
  end

  scenario "Not admin user can't see manage page" do
    user = create(:user)
    login(user)
    visit "/managepage"
    expect(page).to have_content "管理ユーザー専用ページです"
  end
end
