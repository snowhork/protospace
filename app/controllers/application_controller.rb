class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :switch_flash

  add_flash_types :success, :info, :warning, :danger

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :member, :profile, :works, :avatar])
  end

  private

  def switch_flash
    def switch existing_key, new_key
      if flash[existing_key]
        message = flash[existing_key].dup
        flash.delete existing_key
        flash.now[new_key] = message
      end
    end
    switch :notice, :success
    switch :alert, :danger
  end
end
