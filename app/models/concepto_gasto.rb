class ConceptoGasto < ActiveRecord::Base

  has_many :detalle_restricciones
  has_many :detalle_presupuestos
  has_many :detalle_gastos


end
