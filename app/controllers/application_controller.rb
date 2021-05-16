class ApplicationController < ActionController::Base
  include Pundit
  include Pagy::Backend

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [
        :username,
        :email,
        :password,
        :password_confirmation
      ]
    )
  end
end
