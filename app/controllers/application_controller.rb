class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :self_introduction, :user_style, :career, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :self_introduction, :user_style, :career, :image])
  end

  def authenticate_any!
    if user_signed_in?
      true
    else
      redirect_to new_user_session_path
    end
  end
end