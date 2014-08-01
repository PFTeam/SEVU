class HistorialEstadoProyecto < ActiveRecord::Base
  belongs_to :estado_proyecto
  belongs_to :proyecto

  validates :proyecto, :presence => true
  validates :estado_proyecto, :presence => true 

end
