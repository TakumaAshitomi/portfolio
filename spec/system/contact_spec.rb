# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Contact", type: :system do
  scenario "All user can send contact" do
    visit contacts_path
    fill_in "name", with: "テストさん"
    fill_in "message", with: "お問い合わせ内容"
    click_button "送信"
    expect(page).to have_content "お問い合わせを受け付けました。"
  end

  scenario "Cannott send contact if form is not completed" do
    visit contacts_path
    click_button "送信"
    expect(page).to have_content "送信に失敗しました。 フォームに未入力のものがある可能性があります。"
  end
end
