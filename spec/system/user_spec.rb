# frozen_string_literal: true

require "rails_helper"

RSpec.feature "User", type: :system do
  scenario "Create a new user" do
    visit new_user_registration_path
    fill_in   "user_name",                    with: "testuser"
    fill_in   "user_email",                   with: "example@tutorial.com"
    fill_in   "user_password",                with: "password"
    fill_in   "user_password_confirmation",   with: "password"
    click_on  "新規登録"
    expect(page).to have_content "確認メールを登録したメールアドレス宛に送信しました。リンクを開いてアカウントを有効にして下さい。"
  end

  scenario "Login with valid email,password" do
    @user = create(:user)
    visit new_user_session_path
    @user.confirm
    fill_in   "user_email",                   with: @user.email
    fill_in   "user_password",                with: @user.password
    click_button "ログイン"
    expect(page).to have_content "ログインしました。"
  end

  scenario "Failed login" do
    @user = create(:user)
    visit new_user_session_path
    @user.confirm
    fill_in "user_email", with: "wrong@mail.address"
    fill_in "user_password", with: "wrong password"
    click_button "ログイン"
    expect(page).to have_content "メールアドレスまたはパスワードが無効です。"
  end

  scenario "Edit fill_in all form" do
    @user = create(:user)
    @user.confirm
    login_as @user
    visit edit_user_registration_path
    fill_in "user_current_password", with: @user.password
    fill_in "user_password", with: "password_new"
    fill_in "user_password_confirmation", with: "password_new"
    click_on "更新"
    expect(page).to have_content "アカウントが更新されました。"
    logout
    visit new_user_session_path
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: "password_new"
    click_button "ログイン"
    expect(page).to have_content "ログインしました。"
  end

  scenario "Edit fill in all form except new password" do
    @user = create(:user)
    @user.confirm
    login_as @user
    visit edit_user_registration_path
    fill_in "user_current_password", with: @user.password
    click_on "更新"
    expect(page).to have_content "アカウントが更新されました。"
    logout
    visit new_user_session_path
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: "password"
    click_button "ログイン"
    expect(page).to have_content "ログインしました。"
  end

  scenario "Edit profile at mypage" do
    @user = create(:user)
    @user.confirm
    login_as @user
    visit "/users/#{@user.id}"
    fill_in "user_user_profile", with: "update profile"
    click_on "更新する"
    expect(page).to have_content "update profile"
  end

  scenario "Not logged in user can't open pages required login" do
    visit "/users/1"
    visit edit_user_registration_path
    expect(page).to have_content "ログインまたは登録が必要です。"
    visit "/users"
    expect(page).to have_content "ログインしてください。"
  end

  scenario "Can search with ransack form" do
    @user = create(:user)
    @user.confirm
    @user2 = create(:user)
    @user2.name = "aaaa"
    @user2.save
    @user2.confirm
    login_as @user
    visit users_path
    expect(page).to have_content @user.name
    fill_in "q_name_cont", with: @user.name
    click_on "検索"
    expect(page).to have_content @user.name
    expect(page).to_not have_content @user2.name
  end
end
