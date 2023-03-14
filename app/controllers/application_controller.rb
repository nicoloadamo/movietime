class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    # creating an attribute for the uses parameters
    attributes = [:email, :password, :password_confirmation, :nickname, :biography, :photo]

    # user_params.permit(:email, :password, :password_confirmation, :nickname, :biography ) --> replaced by attributes
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
