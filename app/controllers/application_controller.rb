class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :nickname
    # devise_parameter_sanitizer.for(:sign_in)
  end
end
