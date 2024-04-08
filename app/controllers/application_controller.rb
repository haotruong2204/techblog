# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protect_from_forgery with: :exception

  private

  def after_sign_out_path_for resource_or_scope
    return new_admin_admin_session if resource_or_scope == :admin_admin

    super
  end

  def after_sign_in_path_for resource_or_scope
    return admin_root_path if resource_or_scope.is_a?(Admin)

    super
  end

  def record_not_found
    render file: "#{Rails.root}/public/404", layout: true, status: :not_found
  end
end
