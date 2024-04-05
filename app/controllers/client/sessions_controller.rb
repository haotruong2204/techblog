# frozen_string_literal: true

class Client::SessionsController < Devise::SessionsController
  def destroy
    flash[:success] = I18n.t("devise.sessions.signed_out") if sign_out current_account
    redirect_to root_path
  end
end
