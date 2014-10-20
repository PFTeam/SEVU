class HistorialEstadoActividad < ActiveRecord::Base
  belongs_to :actividad
  belongs_to :estado_actividad


  validates :actividad, :presence => false
  validates :estado_actividad, :presence => false 
end
