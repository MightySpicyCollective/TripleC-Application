class PasswordsController < Devise::PasswordsController
  protected
  def after_resetting_password_path_for(resource)
    sign_out(resource)
    root_path
  end
end
