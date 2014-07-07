class DetalleGasto < ActiveRecord::Base
  belongs_to :concepto_gasto
  belongs_to :informe_gastos
  belongs_to :voluntario
  belongs_to :comprobante
end
