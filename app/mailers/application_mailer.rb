# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "Noreply <noreply@coaching-web-app.ml>"
  layout "mailer"
end
