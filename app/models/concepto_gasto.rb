class ConceptoGasto < ActiveRecord::Base

  has_many :detalle_restricciones
  has_many :restricciones, :through => :detalle_restricciones

  has_many :detalle_presupuestos
  has_many :presupuestos, :through => :detalle_presupuestos


  has_many :detalle_gastos
  has_many :informe_gastos, :through => :detalle_gastos

end
