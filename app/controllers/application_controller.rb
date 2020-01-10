class ApplicationController < ActionController::Base

  before_action :configure_devise_params, if: :devise_controller?

  
  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:name, :email, :password, :password_confirmation, :avatar )
    end
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:name, :email, :password, :current_password, :avatar )
    end
  end
end
