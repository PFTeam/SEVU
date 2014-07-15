class Actividad < ActiveRecord::Base
  belongs_to :objetivo_especifico
  belongs_to :proyecto
  belongs_to :tipo_actividad

  has_many :requisitos
  has_many :historial_estado_actividades
  has_many :asignacion_actividades

end
