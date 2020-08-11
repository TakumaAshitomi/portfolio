# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail(
      from: "Noreply <noreply@coaching-web-app.ml>",
      to: ENV["GMAIL_ADDRESS"],
      subject: "お問い合わせ通知"
    )
  end
end
