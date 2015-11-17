class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :update_sanitized_params, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_dashboard_path
    else
      dashboard_path
    end
  end

  private

    def update_sanitized_params
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:email, :password, :password_confirmation, :username, :role_id, :first_name, :last_name)
      end
      devise_parameter_sanitizer.for(:sign_in) do |u|
        u.permit(:password, :username)
      end
    end
end
