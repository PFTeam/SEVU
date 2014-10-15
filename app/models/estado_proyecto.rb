class EstadoProyecto < ActiveRecord::Base

  has_many :historial_estado_proyectos
  has_many :proyectos, :through => :historial_estado_proyectos


  validates :nombre, :uniqueness => { :message => 'No pueden existir dos Estados con el mismo nombre', :case_sensitive => false  }, :length => { :maximum => 250 }, :presence => true
  validates :descripcion, :presence => true, :length => { :maximum => 250 }

  def self.estados_posibles estado_actual
    if estado_actual.nombre == 'Creado'
	    if !self.fechaInicio.blank? && ( self.fechaInicio <= Time.now )
		    estadosPosibles = [EstadoProyecto.find_by(nombre: 'En Ejecución'), EstadoProyecto.find_by(nombre: 'Cancelado'), estado_actual]
	    else
		    estadosPosibles = [EstadoProyecto.find_by(nombre: 'Cancelado'), estado_actual]
	    end
    elsif estado_actual.nombre == 'En Ejecución'
	    if !self.fechaFin.blank? && ( self.fechaFin <= Time.now )
		    estadosPosibles = [EstadoProyecto.find_by(nombre: 'Terminado'), EstadoProyecto.find_by(nombre: 'Suspendido'), EstadoProyecto.find_by(nombre: 'Cancelado'), estado_actual]
	    else
		    estadosPosibles = [EstadoProyecto.find_by(nombre: 'Suspendido'), EstadoProyecto.find_by(nombre: 'Cancelado'), estado_actual]
	    end
    elsif estado_actual.nombre == 'Suspendido'
      estadosPosibles = [EstadoProyecto.find_by(nombre: 'En Ejecución'), EstadoProyecto.find_by(nombre: 'Cancelado'), estado_actual]
    elsif estado_actual.nombre == 'Cancelado'
      estadosPosibles = [estado_actual]
    elsif estado_actual.nombre == 'Terminado'
      estadosPosibles = [estado_actual]
    else
      estadosPosibles = [estado_actual]
    end
  end


  def to_s
    nombre
  end

end
