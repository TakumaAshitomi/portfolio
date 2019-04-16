require "rails_helper"

describe "Create Account", type: :feature do
  it "Signup" do
    #Access signup page
    visit new_user_registration_path
    #fill in  name,email, password, password_confirmation
    fill_in "Name",                    with: "testuser"
    fill_in "Email",                   with: "example@tutorial.com"
    fill_in "Password",                with: "password"
    fill_in "Password confirmation",   with: "password"
    click_on "Sign up"
    expect(page).to have_content "確認メールを登録したメールアドレス宛に送信しました。リンクを開いてアカウントを有効にして下さい。"
  end
end