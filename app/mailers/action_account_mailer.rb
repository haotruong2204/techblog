# frozen_string_literal: true

class ActionAccountMailer < ApplicationMailer
  default from: "haotv03@gmail.com"

  def send_email_welcome email, full_name
    @full_name = full_name
    mail(to: email, subject: "haotruong.dev: Chào mừng bạn đến với blog của mình!")
  end
end
