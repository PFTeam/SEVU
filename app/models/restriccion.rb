class Restriccion < ActiveRecord::Base
  belongs_to :tipo_proyecto

  has_many :detalle_restricciones
  has_many :concepto_gastos, :through => :detalle_restricciones
  
  has_many :presupuestos

end
