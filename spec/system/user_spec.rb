require "rails_helper"

RSpec.feature "User", type: :system do
  
  scenario "Create a new user" do
      #Access signup page
      visit new_user_registration_path
      #fill in  name,email, password, password_confirmation
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
    fill_in   "user_email",                     with: "wrong@mail.address"
    fill_in   "user_password",                  with: "wrong password"
    click_button "ログイン"
    expect(page).to have_content "メールアドレスまたはパスワードが無効です。"
  end
  
  scenario "Edit fill_in all form" do
    @user = create(:user)
    @user.confirm
    login_as(@user)
    visit edit_user_registration_path
    fill_in   "user_current_password",        with: @user.password
    fill_in   "user_password",                with: "password_new"
    fill_in   "user_password_confirmation",   with: "password_new"
    click_on  "更新"
    expect(page).to have_content "アカウントが更新されました。"
    logout
    visit new_user_session_path
    fill_in   "user_email",                   with: @user.email
    fill_in   "user_password",                with: "password_new"
    click_button  "ログイン"
    expect(page).to have_content "ログインしました。"
  end
  
  scenario "Edit fill in all form except new password" do
    @user = create(:user)
    @user.confirm
    login_as(@user)
    visit edit_user_registration_path
    fill_in   "user_current_password",        with: @user.password
    click_on  "更新"
    expect(page).to have_content "アカウントが更新されました。"
    logout
    visit new_user_session_path
    fill_in   "user_email",                   with: @user.email
    fill_in   "user_password",                with: "password"
    click_button  "ログイン"
    expect(page).to have_content "ログインしました。"
  end
  
  scenario "Edit profile at mypage" do
    @user = create(:user)
    @user.confirm
    login_as(@user)
    visit "/users/#{@user.id}"
    fill_in "user_user_profile", with: "update profile"
    click_on "更新する"
    expect(page).to have_content "update profile"
  end
end