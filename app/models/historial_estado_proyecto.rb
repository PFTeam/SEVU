class HistorialEstadoProyecto < ActiveRecord::Base
  belongs_to :estado_proyecto
  belongs_to :proyecto
end
