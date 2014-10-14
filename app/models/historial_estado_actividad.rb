class HistorialEstadoActividad < ActiveRecord::Base
  belongs_to :actividad
  belongs_to :estado_actividad


  validates :actividad, :presence => true
  validates :estado_actividad, :presence => true 
end
