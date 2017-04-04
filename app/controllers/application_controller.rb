class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def configure_permitted_parameters
      if resource_class == User 
          devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname, :phone,:email])
          devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lastname, :phone])
      end
  end
end
