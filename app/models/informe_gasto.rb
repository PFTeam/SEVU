class InformeGasto < ActiveRecord::Base
  belongs_to :proyecto

  has_many :detalle_gastos

end
