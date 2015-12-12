class Actividad < ActiveRecord::Base
  belongs_to :objetivo_especifico
  belongs_to :proyecto
  belongs_to :tipo_actividad

  has_many :requisitos,  :dependent => :destroy
  has_many :habilidades, :through => :requisitos

  has_many :historial_estado_actividades,  :dependent => :destroy
  has_many :estado_actividades, :through => :historial_estado_actividades

  has_many :asignacion_actividades,  :dependent => :destroy
  has_many :usuarios, :through => :asignacion_actividades
  has_many :reportes, :through => :asignacion_actividades
  
  accepts_nested_attributes_for :requisitos


  validates :nombre, :length => { :maximum => 250 }, :presence => true
  validates :descripcion , :presence => true
  
  #before_save :actualizar_estado

  def actualizar_estado
	  if ( !self.duracionReal.nil? && !self.fechaRealInicio.nil? && (self.historial_estado_actividades.last.estado_actividad.nombre == 'Creada' || self.historial_estado_actividades.last.estado_actividad.nombre == 'Planificada' ))
	    self.historial_estado_actividades.new(actividad: self, estado_actividad: EstadoActividad.find_by(nombre: 'Ejecutada')) 
	  elsif ( !self.duracion.nil? && !self.fechaEstimadaInicio.nil? && (self.historial_estado_actividades.last.estado_actividad.nombre == 'Creada' ))
	    self.historial_estado_actividades.new(actividad: self, estado_actividad: EstadoActividad.find_by(nombre: 'Planificada')) 
    end
	  # FALTA CUANDO SE CARGA EL REPORTE PASAR A TERMINADA
  end
def to_s
	nombre
end
def es_repetitiva
	if self.repetitiva == true
		"Sí"
	else
		"No"
	end
end
def borrable
  if ( self.historial_estado_actividades.last.estado_actividad.nombre == "Creada" ) || ( self.historial_estado_actividades.last.estado_actividad.nombre == "Planificada" ) or ( self.historial_estado_actividades.last.estado_actividad.nombre == "Cancelada" ) 
    return true
  else
    return false
  end
end
end
