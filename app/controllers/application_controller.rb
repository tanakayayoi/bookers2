class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if current_user
      user_path(@user)
    else
      user_registration_path
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction, :profile_image_id])
  end

end
