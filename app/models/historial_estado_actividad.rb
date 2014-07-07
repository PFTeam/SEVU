class HistorialEstadoActividad < ActiveRecord::Base
  belongs_to :actividad
  belongs_to :estado_actividad
end
