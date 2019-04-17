require "rails_helper"

describe "Create Account", type: :feature do
  it "Signup" do
    #Access signup page
    visit new_user_registration_path
    #fill in  name,email, password, password_confirmation
    fill_in   "Name",                    with: "testuser"
    fill_in   "Email",                   with: "example@tutorial.com"
    fill_in   "Password",                with: "password"
    fill_in   "Password confirmation",   with: "password"
    click_on  "Sign up"
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
      fill_in   "Email",                   with: "example@test.com"
      fill_in   "Password",                with: "password"
      click_on  "Log in"
      expect(page).to have_content "ログインしました。"
    end
  end
  context "invalid email" do
    it "can't login" do
      visit new_user_session_path
      @user.confirm
      fill_in   "Email",                     with: "wrong@mail.address"
      fill_in   "Password",                  with: "wrong password"
      click_on  "Log in"
      expect(page).to have_content "メールアドレスまたはパスワードが無効です。"
    end
  end
end
end