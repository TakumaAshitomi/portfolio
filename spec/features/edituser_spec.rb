require "rails_helper"

describe "Edit profile", type: :feature do
  before do
    @user = create(:user)
    @user.confirm
    login_as(@user)
  end
  context "fill_in all form" do
    it "can update profile" do
      visit edit_user_registration_path
      fill_in   "user_password",                with: "password_new"
      fill_in   "user_password_confirmation",   with: "password_new"
      fill_in   "user_current_password",        with: "password"
      click_on  "Update"
      expect(page).to have_content "アカウントが更新されました。"
      logout
      visit new_user_session_path
      fill_in   "Email",                   with: "example@test.com"
      fill_in   "Password",                with: "password_new"
      click_on  "Log in"
      expect(page).to have_content "ログインしました。"
    end
  end
  context "fill_in all form except password" do
    it "can update profile with name,email,current password" do 
      visit edit_user_registration_path
      fill_in   "user_current_password",        with: "password"
      click_on  "Update"
      expect(page).to have_content "アカウントが更新されました。"
      logout
      visit new_user_session_path
      fill_in   "Email",                   with: "example@test.com"
      fill_in   "Password",                with: "password"
      click_on  "Log in"
      expect(page).to have_content "ログインしました。"
    end
  end
end