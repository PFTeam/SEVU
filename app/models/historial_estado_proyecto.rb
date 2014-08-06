class HistorialEstadoProyecto < ActiveRecord::Base
  belongs_to :estado_proyecto
  belongs_to :proyecto
  
  #Tiene que ir en true, pero no toma el id, por mas que esté asignado
  validates :proyecto, :presence => false
  validates :estado_proyecto, :presence => true 

end
