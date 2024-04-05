# frozen_string_literal: true

class Client::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    generic_callback(:google_oauth2)
  end

  def generic_callback provider
    @account = Account.from_omniauth(request.env["omniauth.auth"])
    account_exits = Account.where("email = ? and provider != ?", @account.email, provider).take
    return handle_account_exits(account_exits, provider) if account_exits

    if @account.persisted?
      set_flash_message(:notice, :success, kind: provider.capitalize)
    else
      @account.email = @account.uid if @account.email.blank?
      @account.save(validate: false)
      ActionAccountMailer.send_email_welcome(@account.email, @account.full_name).deliver_later
    end
    @account.update last_sign_in_at: Time.zone.now
    sign_in_and_redirect @account, event: :authentication
  end

  def failure
    redirect_to root_path
  end

  private

  def handle_account_exits account_exits, provider
    account_exits.uid = @account.uid
    account_exits.provider = provider

    account_exits.save
    set_flash_message(:notice, :success, kind: provider.capitalize)
    sign_in_and_redirect account_exits, event: :authentication
  end
end
