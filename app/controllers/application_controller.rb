class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
 
  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up){ |u| u.permit(:email,:password,:avatar)}
      devise_parameter_sanitizer.permit(:account_update){|u| u.permit(:email, :password, :current_password,:avatar)}
  end
  def avatar_url
    User.avatar_url(:medium)
  end

  def allow_roles(role)
    message = 'No esta autorizado para accesar a este recurso'
    redirect_to root_path, alert: message if role.to_s != current_user.role
  end
end
