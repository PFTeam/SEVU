class DetalleRestriccion < ActiveRecord::Base
  belongs_to :restriccion
  belongs_to :concepto_gasto
end
