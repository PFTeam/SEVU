class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

#For CanCan-----------------------------------------
	 rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "No esta autorizado a acceder a la pagina solicitada."
  end

	def current_ability
  @current_ability ||= Ability.new(current_usuario)
	end
#---------------------------------------------------

  protect_from_forgery with: :exception	

#For Devise-----------------------------------------
	before_filter :authenticate_usuario!
	before_action :configure_permitted_parameters, if: :devise_controller?
#---------------------------------------------------
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| 
      u.permit(:email, :password, :password_confirmation, :apellido_nombre, :nombreUsuario, :direccion, :fechaRegistro, :foto) 
   }
  end



end
