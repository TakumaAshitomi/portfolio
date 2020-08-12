# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail(
      from: "Noreply <noreply@coaching-web-app.ml>",
      to: Rails.application.credentials.gmail[:address],
      subject: "お問い合わせ通知"
    )
  end
end
