class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

#For CanCan-----------------------------------------
	 rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "No esta autorizado a acceder a la pagina solicitada."
  end

#def current_ability
#	if Rails.env.test? then
#	  @current_ability ||= Ability.new(Usuario.find_by(nombreUsuario: "admin"))
#        else
#	    @current_ability ||= Ability.new(current_usuario)
#    end
#end


	def current_ability
		 @current_ability ||= Ability.new(current_usuario)
	end
#---------------------------------------------------

  protect_from_forgery with: :exception	

#For Devise-----------------------------------------
	before_filter :authenticate_usuario! unless Rails.env.test?
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :cargar_notificaciones
#---------------------------------------------------
  protected
  def puede_configurar? #pregunta si puede hacer algun tipo de configuraciones del sistema o del proyecto
    if can? :manage, Rol then
      return true
    end
    if can? :manage, TipoHabilidad then
      return true
    end
    if can? :manage, ConceptoGasto then
      return true
    end
    if can? :manage, Habilidad then
      return true
    end
    if can? :manage, Restriccion then
      return true
    end
    if can? :manage, NotificacionPredeterminada then
      return true
    end
  end
helper_method :puede_configurar?
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| 
      u.permit(:email, :password, :password_confirmation, :apellido_nombre, :nombreUsuario, :direccion, :foto) 
   }
  end

  def cargar_notificaciones
	  @notificaciones = NotificacionSistema.find_by(usuario_destino_id: current_usuario, notificado: false).to_a
	  #@notificaciones = NotificacionSistema.all
    
  	
  end
end
