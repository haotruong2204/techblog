# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  protect_from_forgery with: :exception

  def render_notfound
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end

  private

  def after_sign_out_path_for resource_or_scope
    return new_admin_admin_session if resource_or_scope == :admin_admin

    super
  end

  def after_sign_in_path_for resource_or_scope
    return admin_root_path if resource_or_scope.is_a?(Admin)

    super
  end
end
