class HistorialEstadoActividad < ActiveRecord::Base
  belongs_to :actividad
  belongs_to :estado_actividad


  validates :proyecto, :presence => true
  validates :estado_proyecto, :presence => true 
end
