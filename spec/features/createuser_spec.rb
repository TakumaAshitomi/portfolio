require "rails_helper"

describe "Create Account", type: :feature do
  
  it "Signup" do
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
  
describe "Session_path", type: :feature do  
  
  before do
    @user = create(:user)
  end
  
  context "valid email,password" do
    it "can login " do
      visit new_user_session_path
      @user.confirm
      fill_in   "user_email",                   with: @user.email
      fill_in   "user_password",                with: @user.password
      click_button "ログイン"
      expect(page).to have_content "ログインしました。"
    end
  end
  
  context "invalid email" do
    it "can't login" do
      visit new_user_session_path
      @user.confirm
      fill_in   "user_email",                     with: "wrong@mail.address"
      fill_in   "user_password",                  with: "wrong password"
      click_button "ログイン"
      expect(page).to have_content "メールアドレスまたはパスワードが無効です。"
    end
  end
  
end
end