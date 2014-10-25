class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception	

	#For Devise
	before_filter :authenticate_usuario!
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :cargar_notificaciones

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| 
      u.permit(:email, :password, :password_confirmation, :apellido_nombre, :nombreUsuario, :direccion, :fechaRegistro, :foto) 
   }
  end

  def cargar_notificaciones
	  @notificaciones = NotificacionSistema.find_by(usuarioDestino: current_usuario, notificado: false).to_a
	  #@notificaciones = NotificacionSistema.all
    
  	
  end

end
