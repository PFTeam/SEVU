class EstadoActividad < ActiveRecord::Base

  has_many :historial_estado_actividades
  has_many :actividades, :through => :historial_estado_actividades

  validates :nombre, :uniqueness => { :message => 'No pueden existir dos Estados con el mismo nombre', :case_sensitive => false  }, :length => { :maximum => 250 }, :presence => true
  validates :descripcion, :presence => true, :length => { :maximum => 250 }



  def self.estados_posibles actividad
	  if actividad.historial_estado_actividades.last.estado_actividad.nombre == 'Creada'
	    estadosPosibles = [EstadoActividad.find_by(nombre: 'Cancelada'), actividad.historial_estado_actividades.last.estado_actividad]
    elsif actividad.historial_estado_actividades.last.estado_actividad.nombre == 'Ejecutada'
      estadosPosibles = [EstadoActividad.find_by(nombre: 'Terminada'), actividad.historial_estado_actividades.last.estado_actividad]
    elsif actividad.historial_estado_actividades.last.estado_actividad.nombre == 'Planificada'
      estadosPosibles = [EstadoActividad.find_by(nombre: 'Cancelada'),actividad.historial_estado_actividades.last.estado_actividad]
    elsif actividad.historial_estado_actividades.last.estado_actividad.nombre == 'Terminada'
      estadosPosibles = [actividad.historial_estado_actividades.last.estado_actividad]
    else
      estadosPosibles = [actividad.historial_estado_actividades.last.estado_actividad]
    end
  end

  def to_s
	  nombre
  end
end
