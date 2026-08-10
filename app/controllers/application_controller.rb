class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user, :logged_in?, :super_admin_signed_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def super_admin_signed_in?
    logged_in? && current_user.super_admin?
  end

  def require_super_admin
    return if super_admin_signed_in?

    redirect_to super_admin_login_path, alert: "Super admin access only."
  end
end
