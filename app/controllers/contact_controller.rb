# frozen_string_literal: true

class ContactController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      flash[:notice] = "お問い合わせを受け付けました。"
    else
      flash[:notice] = "送信に失敗しました。
        フォームに未入力のものがある可能性があります。"
    end
    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :message)
  end
end
