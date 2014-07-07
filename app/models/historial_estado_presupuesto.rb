class HistorialEstadoPresupuesto < ActiveRecord::Base
  belongs_to :presupuesto
  belongs_to :estado_presupuesto
end
