class Comprobante < ActiveRecord::Base

  has_one :detalle_gastos

end
