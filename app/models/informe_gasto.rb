class InformeGasto < ActiveRecord::Base
  belongs_to :proyecto

  has_many :detalle_gastos
  has_many :concepto_gastos, :through => :detalle_gastos

  validates_presence_of :proyecto, message: " - es obligatorio"
 

end
