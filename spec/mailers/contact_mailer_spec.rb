# frozen_string_literal: true

require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  before do
    @contact = build(:contact)
    ContactMailer.send_mail(@contact).deliver_now
  end

  it "can send mail" do
    expect(ActionMailer::Base.deliveries.last.subject).to eq("お問い合わせ通知")
  end
end
