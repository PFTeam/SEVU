class EstadoProyecto < ActiveRecord::Base

  has_many :historial_estado_proyectos
  has_many :proyectos, :through => :historial_estado_proyectos


  validates :nombre, :uniqueness => { :message => 'No pueden existir dos Estados con el mismo nombre', :case_sensitive => false  }, :length => { :maximum => 250 }, :presence => true
  validates :descripcion, :presence => true, :length => { :maximum => 250 }

  def self.estados_posibles proyecto
    if proyecto.historial_estado_proyectos.last.estado_proyecto.nombre == 'Creado'
	    if !proyecto.fechaInicio.blank? && ( proyecto.fechaInicio <= Time.now )
		    estados_posibles = [EstadoProyecto.find_by(nombre: 'En Ejecución'), EstadoProyecto.find_by(nombre: 'Cancelado'), proyecto.historial_estado_proyectos.last.estado_proyecto]
	    else
		    estadosPosibles = [EstadoProyecto.find_by(nombre: 'Cancelado'), proyecto.historial_estado_proyectos.last.estado_proyecto]
	    end
    elsif proyecto.historial_estado_proyectos.last.estado_proyecto.nombre == 'En Ejecución'
	    if !self.fechaFin.blank? && ( self.fechaFin <= Time.now )
		    estadosPosibles = [EstadoProyecto.find_by(nombre: 'Terminado'), EstadoProyecto.find_by(nombre: 'Suspendido'), EstadoProyecto.find_by(nombre: 'Cancelado'),proyecto.historial_estado_proyectos.last.estado_proyecto]
	    else
		    estadosPosibles = [EstadoProyecto.find_by(nombre: 'Suspendido'), EstadoProyecto.find_by(nombre: 'Cancelado'),proyecto.historial_estado_proyectos.last.estado_proyecto]
	    end
    elsif proyecto.historial_estado_proyectos.last.estado_proyecto.nombre == 'Suspendido'
      estadosPosibles = [EstadoProyecto.find_by(nombre: 'En Ejecución'), EstadoProyecto.find_by(nombre: 'Cancelado'),proyecto.historial_estado_proyectos.last.estado_proyecto]
    elsif proyecto.historial_estado_proyectos.last.estado_proyecto.nombre == 'Cancelado'
      estadosPosibles = [proyecto.historial_estado_proyectos.last.estado_proyecto]
    elsif proyecto.historial_estado_proyectos.last.estado_proyecto.nombre == 'Terminado'
      estadosPosibles = [proyecto.historial_estado_proyectos.last.estado_proyecto]
    else
      estadosPosibles = [estado_actual]
    end
  end


  def to_s
    nombre
  end

end
