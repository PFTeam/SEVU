class EstadoProyecto < ActiveRecord::Base

  has_many :historial_estado_proyectos
  has_many :proyectos, :through => :historial_estado_proyectos

end
