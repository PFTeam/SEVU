class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
		super
    AsignacionFuncion.create!(rol: Rol.find_by(tipo_rol: (TipoRol.find_by! nombre: 'Sistema'), nombre:'Default'), usuario: @usuario, esActual: true, descripcion: "default" )
  end

  def update
    super
  end
end 
