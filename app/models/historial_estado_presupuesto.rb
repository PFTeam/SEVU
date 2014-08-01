class HistorialEstadoPresupuesto < ActiveRecord::Base
  belongs_to :presupuesto
  belongs_to :estado_presupuesto


  validates :proyecto, :presence => true
  validates :estado_proyecto, :presence => true 
end
